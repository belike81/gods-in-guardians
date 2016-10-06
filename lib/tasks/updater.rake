namespace :updater do
  desc "Updates users stats from the API"
  task work: :environment do
    puts "Updating user stats"
    Updaters::Base.new(User.all).update
    puts "Update completed!"
  end

  desc "Get charcters"
  task characters_import: :environment do
    puts "Updating user characters"
    Updaters::Character.new(User.all).update
    puts "Update completed!"
  end

end
