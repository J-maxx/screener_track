namespace :db do
  
 task :populate => :environment do
  desc "erase? and fill database"
  
 [User, Project, Asset, Request].each(&:delete_all)
 # user data
    ['user','postcrew','manager','approver'].each do |u|
      uu=User.find_or_create_by_email (u+'@ff.com')
      uu.name=('Mr. '+ u.capitalize)
      uu.role=u
      uu.password = 'pass'
      uu.save
      end

  # project data
  ['Hanna','The Debt','One Day','Beginners'].each do |p|
  pp=Project.create(:name => p, :release_date => '2011, May, 26')
  uu=User.first
  aa=Asset.create(:project_id => pp.id, :version_name =>'Preview #1',:version_date => '2011, March, 12', :running_time => '1:20', :media =>'dvd', :cut_description => 'Best ever', :user_id => uu.id, :version_number => '2')

  end
  
end # end task


end # end namespace