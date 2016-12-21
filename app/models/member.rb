class Member < ApplicationRecord
  audited
  belongs_to :user
  belongs_to :site
  validates_presence_of :user_id, :site_id, :name
  validates_uniqueness_of :user_id, scope: :site_id
  validates_with EmailValidator, :attributes => :email, allow_blank: true
  validates_with QqValidator, :attributes => :qq, allow_blank: true
  enum gender: [ :male, :female, :secret ]

  def self.gender
    [['男', :male], ['女', :female], ['保密', :secret]]
  end
end
