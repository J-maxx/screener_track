class ChangeDetailsForRequests < ActiveRecord::Migration
  def self.up
    change_column :requests, :fulfillment_date, :datetime
  end

  def self.down
  end
end
