class AddVmTypeToVms < ActiveRecord::Migration[6.0]
  def change
    add_column :vms, :vm_type, :string
  end
end
