class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :short_title
      t.text :description

      t.timestamps
    end
  end
end
