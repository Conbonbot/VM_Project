class Remove < ActiveRecord::Migration[6.0]
  def change
    remove_column :vms, :username
  end
end
