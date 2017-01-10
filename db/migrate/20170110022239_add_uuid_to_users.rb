class AddUuidToUsers < ActiveRecord::Migration[5.0]
  self.execute <<-EOF
    CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
  EOF
  def change
    add_column :users, :uuid, :uuid, default: 'uuid_generate_v4()'
  end
end
