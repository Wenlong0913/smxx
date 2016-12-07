class ApplicationRecord < ActiveRecord::Base
  include CastPinyinConcern
  self.abstract_class = true
end
