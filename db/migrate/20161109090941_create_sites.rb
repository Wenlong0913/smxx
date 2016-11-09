class CreateSites < ActiveRecord::Migration[5.0]
  def change
    create_table :sites do |t|
      t.references :theme_config, index: true
      t.references :user, index: true
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
