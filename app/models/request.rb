# == Schema Information
# Schema version: 20110515173508
#
# Table name: requests
#
#  id               :integer         not null, primary key
#  user_id          :integer
#  asset_id         :integer
#  required_date    :date
#  status           :string(255)
#  approver_id      :integer
#  recipient_name   :string(255)
#  delivery_method  :string(255)
#  created_at       :datetime
#  updated_at       :datetime
#  approval_date    :datetime
#  fulfillment_date :time
#  fulfilled_by     :integer
#

class Request < ActiveRecord::Base
  
  attr_accessible :required_date, :status, :approver_id, :recipient_name, :delivery_method, :created_at, :updated_at, :asset_id, :user_id
  
  belongs_to :user
  belongs_to :asset
  has_one :project, :through => :asset

end
