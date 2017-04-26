class Cms::Comment < ApplicationRecord
  audited
  belongs_to :site, class_name: '::Cms::Site'
end
