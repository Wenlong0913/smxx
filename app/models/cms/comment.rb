class Cms::Comment < ApplicationRecord
  audited
  belongs_to :site, class_name: '::Cms::Site'
  store_accessor :features, :status, :properties, :name, :mobile_phone, :tel_phone,:email,:qq,
  :address,:gender,:birth,:hobby,:content2,:content3,:branch,:datetime

end
