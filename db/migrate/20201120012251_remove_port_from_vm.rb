class RemovePortFromVm < ActiveRecord::Migration[6.0]
  def change
    remove_column :vms, :port
  end
end
