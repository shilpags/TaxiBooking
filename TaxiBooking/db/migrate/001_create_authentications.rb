class CreateAuthentications < ActiveRecord::Migration
#  def self.up
#    create_table :authentications do |t|
#    end
#  end
#
#  def self.down
#    drop_table :authentications
#  end
   def change
    create_table :authentications do |t|
      t.column :uid, :string
      t.column :provider, :string
      t.column  :oauth_token, :string
      t.references :user, index: true, foreign_key: true

      t.column :timestamp, null: false
    end
  end
end
