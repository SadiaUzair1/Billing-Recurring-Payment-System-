# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

PlanUsageTable.create

Feature.create(
  name: 'Feature 1',
  code: 1.2,
  unit_price: 2,
  max_unit_limit: 3,
  plan_id: 1
)
Plan.create(
  monthly_fee: 100,
  name: 'myplan'
)
Subscription.create(
  plan_id: 1,
  user_id: 1,
  plan_usage_table_id: 1
)

User.create(
  name: 'FATIMA',
  email: 'fatima@gmail.com',
  password: 'fatimas',
  userType: 'buyer'
)
User.create(
  name: 'SADIA',
  email: 'sadia@gmail.com',
  password: 'sadiaaa',
  userType: 'admin'
)


PlanUsage.create(user_id: 2, plan_name: 'Plan f')
