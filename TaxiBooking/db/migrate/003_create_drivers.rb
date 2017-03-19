class CreateDrivers < ActiveRecord::Migration
#  def self.up
#    create_table :drivers do |t|
#    end
#  end
#
#  def self.down
#    drop_table :drivers
#  end
def change	
  create_table(:drivers) do |t|
      ## Database authenticatable
      t.column :name, :string,              null: false, default: ''
      t.column :email, :string,      null: false, default: ''
      t.column :password, :string, null: false, default: ''
      t.column :phone, :string, null: false, default: ''
    end

    add_index :drivers, :email,                unique: true
 end
end
