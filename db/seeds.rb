# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Airport.delete_all
# airports = { 'SFO' => 'San Francisco', 'OAK' => 'Oakland', 'IAD' => 'Washington', 'BWI' => 'Baltimore', 'JFK' => 'New York', 'EWR' => 'Newark', 'LGA' => 'New York'}
# airports.each do |code, city|
#   Airport.create(code: code, city: city)
# end

Flight.delete_all
def rand_time
  DateTime.at(rand_in_range(DateTime.now.to_f, (DateTime.now + 365.days).to_f))
end
flights = [['2h30m', DateTime.now + 12.days, 1, 6], ['58m', DateTime.now + 44.days, 3, 2], ['7h2m', DateTime.now + 51.hours, 6, 4], ['3h12m', DateTime.now + 99.days, 7, 5]]
flights.each do |flight|
  Flight.create(duration: flight[0], datetime: flight[1], departure_airport_id: flight[2], arrival_airport_id: flight[3])
end
