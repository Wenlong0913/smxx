class AddSiteRefToClassorders < ActiveRecord::Migration[5.0]
  def change
    add_reference :classorders, :site, foreign_key: true
  end
end
