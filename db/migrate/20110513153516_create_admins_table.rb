class CreateAdminsTable < ActiveRecord::Migration
  def self.up
    create_table :appadmins do |t|
      t.timestamps
    end
  end

  def self.down
    drop_table :appadmins
  end
end
