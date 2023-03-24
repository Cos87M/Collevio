# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "creating seeds..."

Activity.destroy_all
Room.destroy_all
Photo.destroy_all
Tag.destroy_all
Chatroom.destroy_all
Kid.destroy_all
User.destroy_all
Event.destroy_all
Announcements.destroy_all

# USER
parent = User.create(first_name: "Joy", last_name: "Petterson", password: "123456", email: "parent@parent.com", teacher: false)

parent_paul = User.create(first_name: "Paul", last_name: "Petterson", password: "123456", email: "marry@marry.com", teacher: false)

teacher = User.create(first_name: " Ms Mary", last_name: "White", password: "123456", email: "teacher@teacher.com", teacher: true)

teacher_ana = User.create(first_name: " Ms Ana", last_name: "Bennett", password: "123456", email: "ana@ana.com", teacher: true)

firste_seed = Event.create(
  title: 'Easter',
  start_date: Time.strptime('04/07/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('04/09/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Easter Egg Lace Card, Egg and Spoon Race, Eggs for Fun, Easter Coloring Eggs Activity.'
)

seconde_seed = Event.create(
  title: 'Sports day',
  start_date: Time.strptime('04/21/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('04/21/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Gymnastics, Swimming, Biking, Karate, Soccer.'
)

thirde_seed = Event.create(
  title: 'Carnival',
  start_date: Time.strptime('09/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('09/30/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Popcorn counting printable, Elephant toothpaste explosion experiment, Carnival alphabet sensory bin.'
)

fourthe_seed = Event.create(
  title: 'Halloween',
  start_date: Time.strptime('10/30/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('10/30/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Skeleton Letters, Halloween Writing Center, Halloween Color Clip, Trick-or-Treat Numbers.'
)

last_seed = Event.create(
  title: "Mark's birthday",
  start_date: Time.strptime('03/27/2023 08:00', '%m/%d/%Y %H:%M'),
  end_date: Time.strptime('03/27/2023 15:00', '%m/%d/%Y %H:%M'),
  description: 'Mark turns 2!'
)

# KIDS
max = Kid.create(
  first_name: 'Max',
  last_name: 'Ortega'
)

kid_two = Kid.create(
  first_name: 'Mark',
  last_name: 'Begu'
)

# PARENTS
parent_relationship_a = Parent.new
parent_relationship_a.user_id = parent.id
parent_relationship_a.kid_id = max.id
parent_relationship_a.save

parent_relationship_b = Parent.new
parent_relationship_b.user_id = parent_paul.id
parent_relationship_b.kid_id = max.id
parent_relationship_b.save

# kid_three = Kid.create(
#   first_name: 'Lucas',
#   last_name: 'Petterson'
# )

# kid_four = Kid.create(
#   first_name: 'William',
#   last_name: 'Kola'
# )

# kid_five = Kid.create(
#   first_name: 'Mona',
#   last_name: 'Laci'
# )

# ACTIVITIES
first_seed = Activity.new(
  bowel_movement: 1,
  nap_duration: 120,
  snack: 'Ham with cheese',
  snack_consumption: 'all',
  lunch_consumption: 'most',
  lunch: 'Vegetable soup',
  date: Time.strptime('03/20/2023 17:00', '%m/%d/%Y %H:%M'),
  overall_mood: 'normal'
)
first_seed.kid = max
first_seed.user = teacher
first_seed.save!

second_seed = Activity.new(
  bowel_movement: 2,
  nap_duration: 150,
  snack: 'Cookies with whole milk',
  lunch: 'Ham and cheese sandwich, with side of cut oranges',
  snack_consumption: 'all',
  lunch_consumption: 'all',
  date: Time.strptime('03/21/2023 17:00', '%m/%d/%Y %H:%M'),
  overall_mood: 'More easily irritated'
)
second_seed.kid = max
second_seed.user = teacher
second_seed.save!

third_seed = Activity.new(
  bowel_movement: 1,
  nap_duration: 120,
  snack: 'Peanut butter and apples',
  lunch: 'Tomato soup and chicken pasta',
  date: Time.strptime('03/22/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'little',
  lunch_consumption: 'most',
  overall_mood: 'Happy overall'
)
third_seed.kid = max
third_seed.user = teacher_ana
third_seed.save!

fourth_seed = Activity.new(
  bowel_movement: 0,
  nap_duration: 120,
  snack: 'Kiwi and yogurt',
  lunch: 'Spaghetti and meatballs',
  date: Time.strptime('03/23/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'most',
  lunch_consumption: 'all',
  overall_mood: 'Happy overall'
)
fourth_seed.kid = max
fourth_seed.user = teacher_ana
fourth_seed.save!

fifth_activity = Activity.new(
  bowel_movement: 1,
  nap_duration: 100,
  snack: 'Banana and yoghurt',
  lunch: 'Chicken and beans with rice',
  date: Time.strptime('03/24/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'most',
  lunch_consumption: 'most',
  overall_mood: 'Happy overall'
)
fifth_activity.kid = max
fifth_activity.user = teacher
fifth_activity.save!

sixth_activity = Activity.new(
  bowel_movement: 1,
  nap_duration: 120,
  snack: 'Oatmeal cookie and whole milk',
  lunch: 'Baked hake with rice',
  date: Time.strptime('03/27/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'all',
  lunch_consumption: 'little',
  overall_mood: 'Happy overall'
)

sixth_activity.kid = max
sixth_activity.user = teacher
sixth_activity.save!

seventh_activity = Activity.new(
  bowel_movement: 0,
  nap_duration: 110,
  snack: 'Yoghurt and banana',
  lunch: 'Pulled pork sandwich',
  date: Time.strptime('03/28/2023 17:00', '%m/%d/%Y %H:%M'),
  snack_consumption: 'most',
  lunch_consumption: 'most',
  overall_mood: 'Happy overall'
)

seventh_activity.kid_id = max.id
seventh_activity.save

oner_seed = Room.new(
  name: 'Precious gems'
)
oner_seed.kid = max
oner_seed.user = teacher
oner_seed.save

  # twor_seed = Room.new(
  # name: 'Golden elephant'
  # )

  # twor_seed.kid = kid_two
  # twor_seed.user = teacher
  # twor_seed.save

  # threer_seed = Room.new(
  #   name: 'Sweet panda'
  # )
  # threer_seed.kid = kid_three
  # threer_seed.user = teacher_ana
  # threer_seed.save

  # fourr_seed = Room.new(
  #   name: 'Delicious penguine'
  # )
  # fourr_seed.kid = kid_four
  # fourr_seed.user = teacher
  # fourr_seed.save

  # fiver_seed = Room.new(
  #   name: 'Silver monkey'
  # )

  # fiver_seed.kid = kid_five
  # fiver_seed.save


  #
chatroom_max = Chatroom.new(name: "Max's chatroom")
chatroom_max.kid = max
chatroom_max.save!

firsta_seed = Announcement.new(
     title: '',
     content: ''
   )
   firsta_seed.user = teacher
   firsta_seed.save

   seconda_seed = Announcement.new(
     title: '',
     content: ''
   )
   seconda_seed.user = teacher
   seconda_seed.save

   thirda_seed = Announcement.new(
     title: '',
     content: ''
   )
   thirda_seed.user = user_three
   thirda_seed.save

   fourtha_seed = Announcement.new(
     title: '',
     content: ''
   )
      fourtha_seed.user = user_four
      fourtha_seed.save

      fiftha_seed = Announcement.new(
          title: '',
           content: ''
         )
         fiftha_seed.user = teacher
         fiftha_seed.save

         sixtha_seed = Announcement.new(
           title: '',
           content: ''
         )
         sixtha_seed.user = teacher
         sixtha_seed.save

         seventha_seed = Announcement.new(
           title: '',
           content: ''
         )
         seventha_seed.user = user_three
         seventha_seed.save

         eightha_seed = Announcement.new(
           title: '',
           content: ''
         )
         eightha_seed.user = user_three
         eightha_seed.save

         tentha_seed = Announcement.new(
          title: '',
          content: ''
        )
        tentha_seed.user = user_three
        eightha_seed.save

        eightha_seed = Announcement.new(
          title: '',
          content: ''
        )
        eightha_seed.user = user_three
        eightha_seed.save
           # fourtha_seed.user = user_four
           # fourtha_seed.save



photos_array = [
   "https://images.unsplash.com/photo-1587616211892-f743fcca64f9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1503454537195-1dcabb73ffb9?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1597413545419-4013431dbfec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1503919545889-aef636e10ad4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1524503033411-c9566986fc8f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1600880291319-1a7499c191e8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1516627145497-ae6968895b74?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fGtpZHN8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1630465651806-09682f8364b5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGtpbmRlcmdhcnRlbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60.jpg",
   "https://images.unsplash.com/photo-1564429238817-393bd4286b2d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8a2luZGVyZ2FydGVufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60.jpg"
]
counter = 0
photos_array.each do |photo_url|
  file = URI.open(photo_url)
  photo = Photo.create
  photo.photo.attach(io: file, filename: "kids_" + counter.to_s + ".png", content_type: "image/png")
  photo.save
  counter += 1
end


puts "... seeds created ..."
