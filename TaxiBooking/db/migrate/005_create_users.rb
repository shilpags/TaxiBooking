class CreateUsers < ActiveRecord::Migration
#  def self.up
#    create_table :users do |t|
#    end
#  end
#
#  def self.down
#    drop_table :users
#  end
#
    create_table :users do |t|
      ## Database authenticatable
	t.column :name, :string, null: false, default: ''
      	t.column :email, :string, null: false, default: ''
        t.column :password, null: false, default: ''
        t.column :phone, null: false, default: ''
	t.column :timestamps null: false
    end

	add_index :users, :email,                unique: true
  	add_index :users, :reset_password_token, unique: true
end
