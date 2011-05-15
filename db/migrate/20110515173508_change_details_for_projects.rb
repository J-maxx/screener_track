class ChangeDetailsForProjects < ActiveRecord::Migration
  def self.up
    change_column :requests, :approval_date, :datetime
    change_column :requests, :fulfillment_date, :datatime
  end

  def self.down
    
  end
end
