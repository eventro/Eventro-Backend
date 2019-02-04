# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Organizer.create({name: "Organizer1", email: "org1@gmail.com", password: "o12345", phone: "0505993972"})
User.create({name: "Ghadeer", email: "ghadeer@gmail.com", username: "ghadeer_ga", password: "ghadeer123", date_of_birth: "22/3/1993"})
User.create({name: "Moath", email: "moath@gmail.com", username: "moath_ga", password: "moath123", date_of_birth: "22/3/1993"})
Event.create({name: "ev1", description: "desc", image_url: "", start_date: "2019-01-31", end_date: "2019-01-31", location: "loc", location_id: "idlocation", logo: "logo.png", organizer_id: 1})
Comment.create({comment: "Hi, imma comment", event_id: 1, user_id: 1})
Like.create({event_id: 1, user_id: 1})
EventImage.create({image: "https://thinkster.io/assets/homepage/rails-9b13de39de9d2eed10a2418734ee1e584cdc9634c04206af1c2bfcc8b0d0e3d5.png", event_id: 1, user_id: 1})
Attendee.create({event_id: 1, user_id: 1})
Follow.create({follower_id: 2, followee_id: 1})
