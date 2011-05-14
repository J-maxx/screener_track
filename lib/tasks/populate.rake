namespace :db do
  
 task :populate => :environment do
  desc "erase? and fill database"
  
 [User, Project, Asset, Request].each(&:delete_all)
 # user data
    ['user','postcrew','manager','approver'].each do |u|
      uu=User.find_or_create_by_email (u+'@ff.com')
      uu.role=u
      uu.password = 'pass'
      uu.save
      end

  
  # project data
  ['Hanna','My Lfe with Snuggs','Late Night at Think Coffee','How Fun is This'].each do |p|
  pp=Project.find_or_create_by_name(p)
  
  aa=Asset.create(:project_id => pp.id, :version_name =>'first asset', :running_time => '1:20', :media =>'dvd', :cut_description => 'Best ever')

  end
  

end # end task


end # end namespace