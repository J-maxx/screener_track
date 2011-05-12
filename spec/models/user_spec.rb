require 'spec_helper'

describe User do
  it "'s role should be 'user' if not available" do
   uuu=User.new
   uuu.role.should == "user"
 end
 
 it "should return role when available" do 
   uu=User.new(:role => "manager")
   uu.role.should == 'manager'
 end
 
end
