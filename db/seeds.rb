# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

bbb = User.create!(email: 'bbb@gmail.coma', password: 'bbbbbb')
ccc = User.create!(email: 'ccc@gmail.coma', password: 'cccccc')

2.times do
    bbb.boards.create(
        name: Faker::Lorem.sentence(word_count: 3), 
        description: Faker::Lorem.sentence(word_count: 20)
    )
end

2.times do
    ccc.boards.create(
        name: Faker::Lorem.sentence(word_count: 3), 
        description: Faker::Lorem.sentence(word_count: 20)
    )
end