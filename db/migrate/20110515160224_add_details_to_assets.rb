class AddDetailsToAssets < ActiveRecord::Migration
  def self.up
    add_column :assets, :user_id, :integer
    add_column :assets, :version_date, :date
    add_column :assets, :version_number, :integer
  end

  def self.down
    remove_column :assets, :version_date
    remove_column :assets, :user_id
    remove_column :assets, :version_number
  end
end
