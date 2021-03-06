# == Schema Information
# Schema version: 20110515161145
#
# Table name: users
#
#  id            :integer         not null, primary key
#  email         :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#  role          :string(255)
#  name          :string(255)
#

class AppAdmin < ActiveRecord::Base
  belongs_to :user
end

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :role, :name
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_presence_of :email
  validates_uniqueness_of :email
  
  has_many :requests
  has_many :assets
  
  scope :admin, lambda {joins :admins}
  
  def role
    self[:role] || "user"
  end
  
  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end

