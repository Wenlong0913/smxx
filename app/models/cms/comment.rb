class Cms::Comment < ApplicationRecord
  audited
  belongs_to :site
end
