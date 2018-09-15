



AdminUser.delete_all
Rating.delete_all
Event.delete_all
Location.delete_all
User.delete_all

AdminUser.create(email: 'admin@najebkapp.pl', password: 'password')

piotr = User.create!(	{ email: 'piotr.wydrzycki@gmail.com', password: 'password'} )
miles = User.create!(	{ email: 'miles.davis@yahoo.com', password: 'password' })
carlos = User.create!(	{ email: 'carlos.jobim@google.com', password: 'password' })

location1 = Location.create!({name: "name number #{rand(0..199)}", location_type: "pub", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location2 = Location.create!({name: "name number #{rand(0..199)}", location_type: "outside", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location3 = Location.create!({name: "name number #{rand(0..199)}", location_type: "restaurant", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location4 = Location.create!({name: "name number #{rand(0..199)}", location_type: "house_party", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location5 = Location.create!({name: "name number #{rand(0..199)}", location_type: "roof_party", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location6 = Location.create!({name: "name number #{rand(0..199)}", location_type: "bar", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location7 = Location.create!({name: "name number #{rand(0..199)}", location_type: "outside", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location8 = Location.create!({name: "name number #{rand(0..199)}", location_type: "restaurant", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location9 = Location.create!({name: "name number #{rand(0..199)}", location_type: "house_party", is_przypal: false, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})
location0 = Location.create!({name: "name number #{rand(0..199)}", location_type: "roof_party", is_przypal: true, address: "poland, warsaw, debicka", longitude: nil, latitude: nil})




100.times {|x| Event.create!(location_id: location1.id, name: "Event #{x}", start_time: (Time.now - 1.day), end_time: Time.now )}

10.times {|x| Rating.create!(user_id: piotr.id, location_id: location0, rate: "#{x}", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", )}

10.times {|x| Rating.create!(user_id: miles.id, location_id: location2, rate: "#{x}", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", )}

10.times {|x| Rating.create!(user_id: carlos.id, location_id: location3, rate: "#{x}", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit", )}
