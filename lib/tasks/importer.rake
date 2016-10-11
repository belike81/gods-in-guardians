require 'csv'

namespace :importer do
  desc "Import CSV data to database"
  task work: :environment do
    puts "Importing activity definitions"
    ActivityName.destroy_all
    csv = CSV.parse(File.read(Rails.root.join("lib", "tasks", "activity_definitions.csv")), headers: true)

    csv.each do |row|
      hash = eval(row['json'])
      ActivityName.create({
                            activity_hash: hash[:activityHash],
                            activity_type_hash: hash[:activityTypeHash],
                            value: hash[:activityTypeName]
                          })
    end
    puts "Import completed!"

    puts "Importing activity type definitions"
    ActivityType.destroy_all
    csv = CSV.parse(File.read(Rails.root.join("lib", "tasks", "activity_type_definitions.csv")), headers: true)

    csv.each do |row|
      hash = eval(row['json'])
      ActivityType.create({
                            activity_type_hash: hash[:activityTypeHash],
                            identifier: hash[:identifier],
                            value: hash[:activityTypeName]
                          })
    end
    puts "Import completed!"
  end

end
