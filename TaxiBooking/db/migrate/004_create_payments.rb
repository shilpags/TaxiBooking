class CreatePayments < ActiveRecord::Migration
#  def self.up
#    create_table :payments do |t|
#    end
#  end
#
#  def self.down
#    drop_table :payments
#  end
  def change
    create_table :payments do |t|
      t.string :holder_name, null: false, default: ''
      t.string :card_number, null: false, default: ''
      t.string :card_cvv, null: false, default: ''
      t.string :card_expiry, null: false, default: ''
      t.references :user, index: true, foreign_key: true
    end
  end
end
