class AddNameToPairings < ActiveRecord::Migration[7.0]
  def change
    add_column :pairings, :name, :string
  end
end
