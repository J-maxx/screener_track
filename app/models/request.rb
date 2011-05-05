# == Schema Information
# Schema version: 20110504030435
#
# Table name: requests
#
#  id              :integer         not null, primary key
#  user_id         :integer
#  asset_id        :integer
#  required_date   :date
#  status          :string(255)
#  approver_id     :integer
#  recipient_id    :integer
#  delivery_method :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class Request < ActiveRecord::Base
  
  belongs_to :user
  
end
