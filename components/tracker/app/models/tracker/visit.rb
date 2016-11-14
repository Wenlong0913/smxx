module Tracker
  class Visit < ApplicationRecord
    belongs_to :session
    belongs_to :action
    belongs_to :resource, polymorphic: true
    validates_presence_of :url
  end
end
