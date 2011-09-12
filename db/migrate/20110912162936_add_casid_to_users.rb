class AddCasidToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :casid, :string
  end

  def self.down
    remove_column :users, :casid
  end
end
