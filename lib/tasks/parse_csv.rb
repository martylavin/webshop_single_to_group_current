puts 'hi there mart'

require 'csv'
Product = []
CSV.foreach('2016_email_2.csv') do |row|
  puts row.inspect
  first_name = row[1]
  last_name = row[2]
  email = row[0]
  name = first_name.capitalize + ' ' + last_name.capitalize
  puts name + ' ' + email
end






s = "marty" + " lavin"
puts s