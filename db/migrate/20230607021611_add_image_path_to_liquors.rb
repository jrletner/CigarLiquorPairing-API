class AddImagePathToLiquors < ActiveRecord::Migration[7.0]
  def change
    add_column :liquors, :image_path, :string
  end
end
