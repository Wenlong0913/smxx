module Tracker
  class ChangeUserAgentJob < ApplicationJob
    queue_as :default

    def perform(visit_id)
      # Do something later
      visit = Tracker::Visit.find(visit_id)
      browser = Browser.new(visit.user_agent['string'])
      visit.user_agent['name'] = browser.name
      visit.user_agent['platform'] = browser.platform.name
      visit.save
    end
  end
end
