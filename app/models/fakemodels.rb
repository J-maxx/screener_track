class User
 attr_accessor :role :name :email
 def initialize
    @role= ('guest','user','crew','manager','approver')[rand(5)]
    @name = 'fred'
    @email = 'fred@mailinator.com'
  end

end