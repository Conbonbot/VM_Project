class AddPortToVms < ActiveRecord::Migration[6.0]
  def change
    add_column :vms, :port, :string
  end
end
