# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.delete_all
Flight.delete_all

3.times do |i|
  Airport.create(code: 'NYC')
  Airport.create(code: 'SFO')
end


16.times do |i|
  (Airport.first.id).upto(Airport.first.id + 5) do |i|
    id = Airport.find(i).id
    code = Airport.find(id).code

    until id != Airport.find(i).id && code != Airport.find(i).code
      id = Airport.find(rand((Airport.first.id)..(Airport.first.id + 5))).id
      code = Airport.find(id).code
    end

    Airport.find(i).departing_flights.create({ to_airport_id: id, date: rand(1.week).seconds.ago, duration: rand(280..320) })

    Airport.find(i).arriving_flights.create({ from_airport_id: id, date: rand(1.week).seconds.ago, duration: rand(280..320) })
  end
end
