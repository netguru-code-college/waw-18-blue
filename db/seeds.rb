
AdminUser.delete_all
Rating.delete_all
Event.delete_all
Location.delete_all
User.delete_all

AdminUser.create(email: 'admin@najebkapp.pl', password: 'password')

piotr = User.create!(	{ email: 'piotr.wydrzycki@gmail.com',nickname: 'ben', password: 'password'} )
miles = User.create!(	{ email: 'miles.davis@yahoo.com', nickname: 'mile', password: 'password' })
carlos = User.create!(	{ email: 'carlos.jobim@google.com', nickname: 'carlo', password: 'password' })

location1 = Location.create!({name: "name number #{rand(0..199)}", location_type: "pub", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location2 = Location.create!({name: "name number #{rand(0..199)}", location_type: "outside", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location3 = Location.create!({name: "name number #{rand(0..199)}", location_type: "restaurant", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location4 = Location.create!({name: "name number #{rand(0..199)}", location_type: "house_party", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location5 = Location.create!({name: "name number #{rand(0..199)}", location_type: "roof_party", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location6 = Location.create!({name: "name number #{rand(0..199)}", location_type: "pub", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location7 = Location.create!({name: "name number #{rand(0..199)}", location_type: "outside", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location8 = Location.create!({name: "name number #{rand(0..199)}", location_type: "restaurant", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location9 = Location.create!({name: "name number #{rand(0..199)}", location_type: "house_party", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location0 = Location.create!({name: "name number #{rand(0..199)}", location_type: "roof_party", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})

location_list = [location1, location2, location3, location4, location5, location6, location7, location8, location9, location0 ]

def rand_location(location_list)
  e = rand(0..9).floor
  return location_list[e]
end



100.times {|x| Event.create!(location_id: rand_location(location_list).id, name: "Event nr. #{x}", start_time: (Time.now - 1.day), end_time: Time.now )}

10.times {|x| Rating.create!(user_id: piotr.id, location_id: rand_location(location_list).id, rate: "#{x}", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit" )}

10.times {|x| Rating.create!(user_id: miles.id, location_id: rand_location(location_list).id, rate: "#{x}", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit" )}

10.times {|x| Rating.create!(user_id: carlos.id, location_id: rand_location(location_list).id, rate: "#{x}", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit" )}
