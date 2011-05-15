# == Schema Information
# Schema version: 20110515163002
#
# Table name: projects
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  release_date :date
#

class Project < ActiveRecord::Base
  
  attr_accessible :name, :release_date
  
  has_many :assets
  
end

