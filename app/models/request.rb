# == Schema Information
# Schema version: 20110504030435
#
# Table name: requests
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  asset_id        :integer
#  required_date   :date
#  status          :string(255)ß
#  approver_id     :integer
#  recipient_id    :integer
#  delivery_method :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Request < ActiveRecord::Base
  
  attr_accessible :required_date, :status, :approver_id, :recipient_id, :delivery_method, :created_at, :updated_at, :asset_id, :user_id
  
  belongs_to :user
  belongs_to :asset
  has_one :project, :through => :asset
  
  #  How do we reuse the user table for this??? alias user id in the user table to recipient_id? Same for approver....
  
end
