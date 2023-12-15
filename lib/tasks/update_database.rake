task :update_database => :environment do
  system('curl http://localhost:3000/deals_controller/update_database')
end
