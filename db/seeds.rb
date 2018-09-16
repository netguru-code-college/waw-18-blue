AdminUser.create(email: 'admin@najebkapp.pl', password: 'password') unless AdminUser.where(email: 'admin@najebkapp.pl').exists?

Rating.delete_all
Event.delete_all
Location.delete_all
User.delete_all

p "Existing Data Removed!"

User.create(email: 'piotr.wydrzycki@gmail.com',nickname: 'ben', password: 'password')
User.create(email: 'miles.davis@yahoo.com', nickname: 'mile', password: 'password')
User.create(email: 'carlos.jobim@google.com', nickname: 'carlo', password: 'password')

SEEDS_LOCATION_TYPES = %w[pub outside restaurant house_party roof_party]
loc_roads = %w[jerozolimskie mazowiecka puławska krucza smolna chmielna towarowa miodowa górczewska]


SEEDS_LOCATION_TYPES.each do |location_type|
  [true, false].each do |is_przypal|
    Location.create(name: "name number #{rand(0..199)}", location_type: location_type, is_przypal: is_przypal, address: "poland, warsaw, #{loc_roads.sample}, #{rand(1..30).floor}")
  end
end

location_ids = Location.pluck(:id)

100.times do |x|
  Event.create(location_id: location_ids.sample, name: "Event nr. #{x}", start_time: (Time.now - 1.day), end_time: Time.now )
end

User.all.each do |user|
  10.times do |x|
    Rating.create(user_id: user.id, location_id: location_ids.sample, rate: "#{x}", desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit" )
  end
end

p 'Seeds Done!'
