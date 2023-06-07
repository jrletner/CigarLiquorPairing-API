class AddImagePathToCigars < ActiveRecord::Migration[7.0]
  def change
    add_column :cigars, :image_path, :string
  end
end
