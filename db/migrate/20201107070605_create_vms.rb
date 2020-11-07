class CreateVms < ActiveRecord::Migration[6.0]
  def change
    create_table :vms do |t|
      t.string :type
      t.string :vm_name
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :vms, [:user_id, :created_at]
  end
end
