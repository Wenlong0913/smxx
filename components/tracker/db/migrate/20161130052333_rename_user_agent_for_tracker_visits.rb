class RenameUserAgentForTrackerVisits < ActiveRecord::Migration[5.0]
  def change
    rename_column :tracker_visits, :user_agent, :user_agent_data
  end
end
