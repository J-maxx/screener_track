# == Schema Information
# Schema version: 20110504030435
#
# Table name: projects
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Project < ActiveRecord::Base
  
  attr_accessible :name
  
  has_many :assets
  
end

