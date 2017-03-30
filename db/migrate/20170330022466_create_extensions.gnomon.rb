# This migration comes from gnomon (originally 20170328013626)
class CreateExtensions < ActiveRecord::Migration[5.0]
  def up
    execute "CREATE EXTENSION cube"
    execute "CREATE EXTENSION earthdistance"
  end
end
