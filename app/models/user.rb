# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  nickname               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  username               :string
#

class User < ApplicationRecord
  MAIN_ID = 1
  rolify
  has_and_belongs_to_many :permissions, join_table: 'users_permissions'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable
  audited
  has_many :api_tokens, dependent: :destroy
  has_one :mobile, dependent: :destroy
  has_one :weixin, dependent: :destroy
  has_many :image_items, dependent: :destroy, as: :owner
  has_many :attachments, dependent: :destroy, as: :owner
  has_many :members, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :shopping_carts, dependent: :destroy
  has_many :sites
  has_many :preorder_conversitions
  has_many :create_order, class_name: 'Order', foreign_key: :create_by
  has_many :update_order, class_name: 'Order', foreign_key: :update_by
  has_many :sales_distribution_resources, class_name: 'SalesDistribution::Resource'
  has_many :address_books, dependent: :destroy
  has_many :user_communities, dependent: :destroy
  has_many :communities, dependent: :destroy, through: :user_communities
  has_many :articles, foreign_key: :author, dependent: :destroy
  # 收藏的店铺
  has_many :site_favorites, -> { where(resource_type: 'Site') }, class_name: 'Favorite::Entry'
  #  收藏的产品
  has_many :product_favorites, -> { joins("join items on items.id = favorite_entries.resource_id").where("items.type = ?", 'Product') }, class_name: 'Favorite::Entry'
  # 产品分销
  has_many :product_sales_dists, -> { where(type_name: '产品') }, class_name: 'SalesDistribution::Resource'
  has_many :tasks, foreign_key: :assignee_id
  has_many_comments
  has_many_favorites
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_attachment_file_name :avatar, matches: [/png\z/i, /jpe?g\z/i]
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 10.megabytes

  attr_accessor :mobile_phone
  validates :mobile_phone, mobile_phone: true, allow_blank: true

  # Find user by phone number
  # @param [String] phone_number
  # @return [User]
  def self.find_by_phone_number(phone_number)
    User::Mobile.find_by(phone_number: phone_number).try(:user)
  end

  def permission?(*symbol_names, any: false)
    finder = ->(symbol_name) do
        permissions.exists?(symbol_name: symbol_name) ||
          roles.joins(:permissions).exists?(Permission.table_name => { symbol_name: symbol_name })
      end
    symbol_names.send(any ? :find : :all?, &finder).present?
  end

  def nickname
    attributes['nickname'] || "匿名"
  end

  ##
  # Devise default required email, if you don't want it , need to define this method.
  #
  def email_required?
    false
  end

  def super_admin_or_admin?
    has_any_role?({name: :admin, resource: :any}, {name: :super_admin, resource: :any})
  end

  def token
    AuthToken.encode(user_id: self.id)
  end

  def issue_api_token(device)
    api_token = api_tokens.find_or_initialize_by(device: device)
    api_token.expired_at = 30.days.since
    api_token.save
    api_token.token
  end

  if Settings.project.sxhop?
    def friends
      SalesDistribution::ResourceUser.joins(:resource).
      where("sales_distribution_resource_users.user_id = ? and sales_distribution_resources.object_type in ('Site', 'Product')",self.id).
      pluck("sales_distribution_resources.user_id")
    end
  end

  def display_headshot
    url =
      if !(avatar.url == "/images/original/missing.png")
        avatar.url(:thumb)
      elsif weixin && weixin.headshot
        weixin.headshot
      else
        headshot
      end
    URI(Settings.site.host).merge( url || "/assets/no-picture.png").to_s
  end

  if Settings.project.imolin?
    def current_community
      @current_comunity ||= user_communities.where(is_current: true).first.try(:community)
    end
  end

end
