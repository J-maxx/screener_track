class CreateRequests < ActiveRecord::Migration
  def self.up
    create_table :requests do |t|
      t.integer :user_id
      t.integer :asset_id
      t.date :required_date
      t.string :status
      t.integer :approver_id
      t.integer :recipient_id
      t.string :delivery_method

      t.timestamps
    end
  end

  def self.down
    drop_table :requests
  end
end
