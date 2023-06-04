class CreateLiquors < ActiveRecord::Migration[7.0]
  def change
    create_table :liquors do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.string :brand, null: false
      t.text :description, null: false
      t.timestamps
    end
  end
end
