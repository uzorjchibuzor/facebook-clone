# frozen_string_literal: true

class AddPaperclipFieldsToPost < ActiveRecord::Migration[5.2]
  def change
    add_column :posts, :image_file_name,    :string
    add_column :posts, :image_content_type, :string
    add_column :posts, :image_file_size,    :integer
    add_column :posts, :image_updated_at,   :datetime
  end
end
