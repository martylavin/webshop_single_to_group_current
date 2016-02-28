namespace :import do
  desc "imports legion email data from a csv file"
  task :data => :environment do 
    require 'csv'
      CSV.foreach('lib/tasks/2016_email_3.csv') do |row|
      first_name = row[1]
      last_name = row[2]
      email = row[0]
      name = first_name.capitalize + ' ' + last_name.capitalize
      User.create(name: name, email: email)
    end
  end
end
