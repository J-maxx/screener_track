class Project < ActiveRecord::Base
  
  attr_accessible :running_time, :version_name, :media, :cut_description, :
  
  has_many :assets
  
end

create_table "assets", :force => true do |t|
   t.integer  "user_id"
   t.time     "running_time"
   t.string   "version_name"
   t.string   "media"
   t.string   "cut_description"
   t.datetime "created_at"
   t.datetime "updated_at"
 end