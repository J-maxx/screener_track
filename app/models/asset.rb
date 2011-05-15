# == Schema Information
# Schema version: 20110515161145
#
# Table name: assets
#
#  id              :integer         not null, primary key
#  project_id      :integer
#  running_time    :time
#  version_name    :string(255)
#  media           :string(255)
#  cut_description :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#  user_id         :integer
#  version_date    :date
#  version_number  :integer
#

class Asset < ActiveRecord::Base
  
  attr_accessible :running_time, :version_name, :media, :cut_description, :project_id, :user_id, :version_date, :version_number
  
  belongs_to :project
  belongs_to :user
  has_many :requests

  
end
