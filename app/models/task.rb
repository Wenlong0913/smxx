class Task < ApplicationRecord
  audited
  belongs_to :site
  belongs_to :resource, polymorphic: true
end
