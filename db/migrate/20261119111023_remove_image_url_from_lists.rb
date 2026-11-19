class RemoveImageUrlFromLists < ActiveRecord::Migration[8.1]
  def change
    remove_column :lists, :image_url, :string
  end
end
