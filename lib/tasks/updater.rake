namespace :updater do
  desc "Updates users stats from the API"
  task work: :environment do
    puts "Updating user stats"
    Updaters::Base.new(User.all).update
    puts "Update completed!"
  end

end
