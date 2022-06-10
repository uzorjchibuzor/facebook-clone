# frozen_string_literal: true

class CreateFriendships < ActiveRecord::Migration[5.2]
  def change
    create_table :friendships do |t|
      t.string :status, default: 'pending'
      t.integer :friend_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
