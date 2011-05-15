class AddDetailsToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :release_date, :date
  end

  def self.down
    remove_column :projects, :release_date
  end
end
