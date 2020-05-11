require 'faker'
User.destroy_all
Event.destroy_all
Attendance.destroy_all

email_array = ["john_dewey@yopmail.com", "judith_butler@yopmail.com", "vandana_shiva@yopmail.com", "jorge_amaldo@yopmail.com", "stefan_zweig@yopmail.com", "alfred_jarry@yopmail.com", "audre_lorde@yopmail.com", "angela_davies@yopmail.com", "james_baldwin@yopmail.com", "william_burroghs@yopmail.com"]

10.times do
User.create(
  email:  email_array.sample,
  encrypted_password: Faker::Code.imei,
  description: Faker::TvShows::Friends.quote,
  first_name: Faker::Name.middle_name,
  last_name: Faker::Name.last_name 
)
end

duration_array = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50] 

10.times do
Event.create(
    start_date: Faker::Date.forward(days: 80),
    duration: duration_array.sample,
    title: Faker::Restaurant.description, 
    description: Faker::Restaurant.review,
    price: Faker::Number.between(from: 1, to: 1000), 
    location: Faker::Address.city,
    admin_id: User.last.id
    )
end

10.times do 
  Attendance.create(
    stripe_customer_id: "123456",
    user_id: User.first.id,
    event_id: Event.first.id
    )
end