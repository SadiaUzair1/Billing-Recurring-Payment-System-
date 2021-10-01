# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(
  name: 'buyer',
  email: 'buyer@gmail.com',
  password: 'buyerr',
  user_type: 0
)

User.create(
  name: 'admin',
  email: 'admin@gmail.com',
  password: 'adminn',
  user_type: 1
)
user = User.first

user.image.attach(
  io: File.open(Rails.root.join('app/assets/images/image.jpeg')),
  filename: 'image.jpeg'
)
user.save!

user = User.second

user.image.attach(
  io: File.open(Rails.root.join('app/assets/images/image.jpeg')),
  filename: 'image.jpeg'
)
user.save!