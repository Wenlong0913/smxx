module Tracker
  class Visit < ApplicationRecord
    store_accessor :user_agent_data, :user_agent, :browser_name, :platform
    belongs_to :session
    belongs_to :action
    belongs_to :resource, polymorphic: true, optional: true
    validates_presence_of :url

    def self.visits(page: 1)
      Tracker::Visit.all.order(created_at: :desc).page(page)
    end
  end
end
