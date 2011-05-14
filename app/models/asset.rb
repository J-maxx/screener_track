# == Schema Information
# Schema version: 20110504030435
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
#

class Asset < ActiveRecord::Base
  
  attr_accessible :running_time, :version_name, :media, :cut_description, :project_id
  
  belongs_to :project

  has_many :requests

  
end
