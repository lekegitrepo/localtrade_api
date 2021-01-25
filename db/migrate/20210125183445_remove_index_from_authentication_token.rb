class RemoveIndexFromAuthenticationToken < ActiveRecord::Migration[6.0]
  def up
    remove_index :users, :authentication_token, :string
  end

  def down
    add_index :users, :authentication_token
  end
end
