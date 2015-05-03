require 'faker'
require 'date'

5.times do

  Note.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    created_at: Faker::Time.between(5.days.ago, Time.now, :all)
  )

end
