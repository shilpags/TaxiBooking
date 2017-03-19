class CreateCabtypes < ActiveRecord::Migration
#  def self.up
#    create_table :taxitypes do |t|
#    end
#  end
#
#  def self.down
#    drop_table :taxitypes
#  end
   def change
    create_table :taxi_types do |t|
      t.column :base_fare, :decimal, null: false, default: 5.0
      t.column :number_of_persons, :integer, null: false, default: 4
      t.column :name, :string, null: false, default: ''
      t.column :color, :string
    end
  end
end
