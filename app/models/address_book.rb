# == Schema Information
#
# Table name: address_books
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  name         :string           not null
#  gender       :string
#  mobile_phone :string           not null
#  city         :string           not null
#  street       :string           not null
#  house_number :string
#  features     :jsonb
#  note         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class AddressBook < ApplicationRecord
  audited
  belongs_to :user
  store_accessor :features, :full_address, :default_delivery_address
end
