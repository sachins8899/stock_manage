class AddToFriendships < ActiveRecord::Migration[5.2]
  def change
    add_column :friendships, :status ,:string, :default => 'P'
  end
end
