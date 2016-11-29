module Tracker
  class Visit < ApplicationRecord
    store_accessor :user_agent
    belongs_to :session
    belongs_to :action
    belongs_to :resource, polymorphic: true, optional: true
    validates_presence_of :url

#    attr_accessor :browser
    def self.visits(page: 1)
      Tracker::Visit.all.order(created_at: :desc).page(page).per(20)
    end
  end
end
