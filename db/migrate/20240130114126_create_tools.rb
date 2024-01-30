class CreateTools < ActiveRecord::Migration[7.1]
  def change
    create_table :tools do |t|
      t.string :name
      t.string :category
      t.text :details
      t.string :location
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
