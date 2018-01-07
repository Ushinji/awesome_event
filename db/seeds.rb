# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create!(
  provider: "twitter",
  uid: "194060720",
  nickname: "ushinji0612",
  image_url: "http://pbs.twimg.com/profile_images/936370211464216577/SXx0qWZB_normal.jpg"
)

99.times do |n|
  name  = "TEST_NAME#{n}"
  place = "TEST_PLACE_#{n}"
  start_time = rand(1..30).days.from_now
  end_time = start_time + rand(1..24).hour
  content = "TEST_CONTENT_#{n}"

  Event.create!(
    user_id: user.id,
    name: name,
    place: place,
    start_time: start_time,
    end_time: end_time,
    content: content
  )
end
