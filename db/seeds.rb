# db/seeds.rb

require 'faker'

# Clear existing data
Article.destroy_all

# Seed 20 articles with random data
30.times do
  Article.create!(
    title: Faker::Book.title,
    body: Faker::Lorem.paragraphs(number: 3).join("\n\n")
  )
end

puts 'Seed data for articles created successfully!'
