class RemovePictureFromPost < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :picture, :string
  end
end
