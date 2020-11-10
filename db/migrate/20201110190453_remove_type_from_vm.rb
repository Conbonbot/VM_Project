class RemoveTypeFromVm < ActiveRecord::Migration[6.0]
  def change
    remove_column :vms, :type
  end
end
