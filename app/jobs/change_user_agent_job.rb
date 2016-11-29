class ChangeUserAgentJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # Do something later
    Tracker::Visit.all.each do |f|
      unless f.user_agent['string'].present?
        f.update(user_agent: {'string': f.user_agent})
      end
      browser = Browser.new(f.user_agent['string'])
      f.user_agent['name'] = browser.name
      f.user_agent['platform'] = browser.platform.name
      f.save
    end
  end
end
