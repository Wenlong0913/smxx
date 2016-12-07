class ApplicationRecord < ActiveRecord::Base
  include QueryAsCSVConcern
  self.abstract_class = true
end
