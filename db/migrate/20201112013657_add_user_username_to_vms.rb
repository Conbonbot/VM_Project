class AddUserUsernameToVms < ActiveRecord::Migration[6.0]
  def change
    add_column :vms, :username, :string
  end
end
