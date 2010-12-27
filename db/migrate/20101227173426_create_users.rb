class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|

      t.string :mail
      t.boolean :is_admin, :default => false
      t.boolean :active, :default => true
      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
