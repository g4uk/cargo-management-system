# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do
  CompanyOwner.create!(first_name: FFaker::Name.first_name,
                       last_name: FFaker::Name.last_name,
                       email: FFaker::Internet.unique.email,
                       password: '12345678', phone: FFaker::PhoneNumber.short_phone_number,
                       confirmed_at: Time.now)
end

10.times do |n|
  Company.create!(name: FFaker::Company.name, address: FFaker::Address.country + ' ' +
                           FFaker::Address.city + ' ' + FFaker::Address.street_address,
                  email: FFaker::Internet.unique.email, phone: FFaker::PhoneNumber.short_phone_number,
                  company_owner_id: n + 1)
end

15.times do
  Customer.create!(first_name: FFaker::Name.first_name,
                   last_name: FFaker::Name.last_name,
                   email: FFaker::Internet.unique.email,
                   password: '12345678',
                   company_phone: FFaker::PhoneNumber.short_phone_number,
                   mobile_phone: FFaker::PhoneNumber.short_phone_number,
                   confirmed_at: Time.now)
end

30.times do
  Driver.create!(first_name: FFaker::Name.first_name,
                 last_name: FFaker::Name.last_name,
                 email: FFaker::Internet.unique.email,
                 password: '12345678',
                 phone: FFaker::PhoneNumber.short_phone_number,
                 birth_date: FFaker::Time.between('1950-01-01 00:00', '1997-01-01 00:00').to_date.strftime('%m/%d/%Y'),
                 medical_examination_validity: FFaker::Time.between('2019-01-01 00:00', '2021-01-01 00:00').to_date.strftime('%m/%d/%Y'))
end

30.times do |n|
  DriverLicense.create!(categories: 'ABCDE',
                        valid_to: FFaker::Time.between('2019-01-01 00:00', '2021-01-01 00:00').to_date.strftime('%m/%d/%Y'),
                        driver_id: n + 1)
end

goods_types = %w[Tech Clothes Food]

100.times do
  Good.create!(name: FFaker::Product.product_name,
               weight: rand(1..100).to_s + 'kg',
               volume: rand(1..5).to_s + 'm3',
               goods_type: goods_types[rand(0..2)],
               customer_id: rand(1..15))
end

30.times do |n|
  InsurancePolicy.create!(valid_to: FFaker::Time.between('2019-01-01 00:00', '2021-01-01 00:00').to_date.strftime('%m/%d/%Y'),
                          insurance_policy_type: rand(1..15).to_s,
                          cost: rand(15.0..150.0).round(2),
                          driver_id: n + 1)
end

30.times do |n|
  Truck.create!(reg_number: rand(100..1000).to_s + 'ABC', body_number: FFaker::Vehicle.vin,
                color: FFaker::Vehicle.base_color, year_of_issue: FFaker::Vehicle.year,
                company_id: rand(1..10), driver_id: n + 1)
end

trailer_type = %w[Long Medium Short]

30.times do |_n|
  Trailer.create!(reg_number: rand(100..1000).to_s + 'ABC', color: FFaker::Vehicle.base_color,
                  trailer_type: trailer_type[rand(0..2)], height: rand(1..6).to_s + 'm',
                  length: rand(5..18).to_s + 'm', volume: rand(10000..150000).to_s + 'm3',
                  year_of_issue: FFaker::Vehicle.year, company_id: rand(1..10))
end
