class AddDetailsToRequests < ActiveRecord::Migration
  def self.up
    add_column :requests, :approval_date, :date
    add_column :requests, :fulfillment_date, :date
    add_column :requests, :fulfilled_by, :integer
    rename_column :requests, :recipient_id, :recipient_name
    change_column :requests, :recipient_name, :string
  end

  def self.down
    remove_column :requests, :fulfillment
    remove_column :requests, :approval_date
    remove_column :requests, :fulfilled_by
    remove_column :requests, :recipient_name
  end
end
