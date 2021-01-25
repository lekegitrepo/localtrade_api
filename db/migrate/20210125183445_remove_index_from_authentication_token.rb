class RemoveIndexFromAuthenticationToken < ActiveRecord::Migration[6.0]
  def up
    remove_index :users, :authentication_token
  end

  def down
    add_index :users, :authentication_token
  end
end
