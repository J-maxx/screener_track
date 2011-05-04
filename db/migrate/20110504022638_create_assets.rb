class CreateAssets < ActiveRecord::Migration
  def self.up
    create_table :assets do |t|
      t.integer :project_id
      t.time :running_time
      t.string :version_name
      t.string :media
      t.string :cut_description

      t.timestamps
    end
  end

  def self.down
    drop_table :assets
  end
end
