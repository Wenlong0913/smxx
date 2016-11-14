class CreateTrackerVisits < ActiveRecord::Migration[5.0]
  def change
    create_table :tracker_visits do |t|
      t.references :session, foreign_key: true
      t.references :action, foreign_key: true
      t.references :user, foreign_key: true
      t.references :resource, polymorphic: true
      t.string :url
      t.string :referer
      t.text :payload
      t.string :user_agent
      t.string :ip_address

      t.timestamps
    end
  end
end
