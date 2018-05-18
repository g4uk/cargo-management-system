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

70.times do
  Company.create!(name: FFaker::Company.name, address: FFaker::Address.country + ' ' +
                           FFaker::Address.city + ' ' + FFaker::Address.street_address,
                  email: FFaker::Internet.unique.email, phone: FFaker::PhoneNumber.short_phone_number,
                  company_owner_id: CompanyOwner.ids.sample)
end

60.times do
  Customer.create!(first_name: FFaker::Name.first_name,
                   last_name: FFaker::Name.last_name,
                   email: FFaker::Internet.unique.email,
                   password: '12345678',
                   company_phone: FFaker::PhoneNumber.short_phone_number,
                   mobile_phone: FFaker::PhoneNumber.short_phone_number,
                   confirmed_at: Time.now)
end
280.times do
  Driver.create!(first_name: FFaker::Name.first_name,
                 last_name: FFaker::Name.last_name,
                 email: FFaker::Internet.unique.email,
                 password: '12345678',
                 company_id: Company.ids.sample,
                 phone: FFaker::PhoneNumber.short_phone_number,
                 birth_date: FFaker::Time.between('1950-01-01 00:00', '1997-01-01 00:00').to_date.strftime('%m/%d/%Y'),
                 medical_examination_validity: FFaker::Time.between('2019-01-01 00:00', '2021-01-01 00:00').to_date.strftime('%m/%d/%Y'))
end

430.times do
  DriverLicense.create!(categories: 'ABCDE',
                        valid_to: FFaker::Time.between('2019-01-01 00:00', '2021-01-01 00:00').to_date.strftime('%m/%d/%Y'),
                        driver_id: Driver.ids.sample)
end

goods_types = %w[Tech Clothes Food]
index = 0
180.times do
  index += 1
  index = 1 if (index % 60).zero?
  Good.create!(name: FFaker::Product.product_name,
               weight: rand(1..100).to_s + 'kg',
               volume: rand(1..5).to_s + 'm3',
               goods_type: goods_types[rand(0..2)],
               customer_id: index)
end

type = %w[Full RU BY EU]
650.times do
  InsurancePolicy.create!(valid_to: FFaker::Time.between('2019-01-01 00:00', '2021-01-01 00:00').to_date.strftime('%m/%d/%Y'),
                          insurance_policy_type: type.sample,
                          cost: rand(15.0..150.0).round(2),
                          driver_id: Driver.ids.sample)
end

400.times do
  company_id = Company.ids.sample
  driver_id = Driver.where(company_id: company_id).ids.sample
  Truck.create!(brand: FFaker::Vehicle.make, truck_model: FFaker::Vehicle.model,
                reg_number: rand(100..1000).to_s + 'ABC', body_number: FFaker::Vehicle.vin,
                color: FFaker::Vehicle.base_color, year_of_issue: FFaker::Vehicle.year,
                company_id: company_id, driver_id: driver_id)
end

trailer_type = %w[Long Medium Short]

750.times do
  company_id = Company.ids.sample
  truck_id = Truck.where(company_id: company_id).ids.sample
  Trailer.create!(reg_number: rand(100..1000).to_s + 'ABC', color: FFaker::Vehicle.base_color.capitalize,
                  trailer_type: trailer_type[rand(0..2)], height: rand(1..6).to_s + 'm',
                  length: rand(5..18).to_s + 'm', volume: rand(10_000..150_000).to_s + 'm3',
                  year_of_issue: FFaker::Vehicle.year, company_id: company_id, truck_id: truck_id)
end

120.times do
  customer_id = Customer.ids.sample
  order = Order.create!(downloading_address: FFaker::Address.country + ' ' +
                                    FFaker::Address.city + ' ' + FFaker::Address.street_address,
                        unloading_address: FFaker::Address.country + ' ' +
                                  FFaker::Address.city + ' ' + FFaker::Address.street_address,
                        cost: rand(1000..120_000),
                        customer_id: customer_id)
  good_id = Good.where(customer_id: customer_id).ids.sample
  if good_id
    good_id
  else
    good_id = Customer.find(customer_id).goods.create!(name: FFaker::Product.product_name,
                                                       weight: rand(1..100).to_s + 'kg',
                                                       volume: rand(1..5).to_s + 'm3',
                                                       goods_type: goods_types[rand(0..2)]).id
  end
  rand(1..7).times { GoodsOrder.create!(order_id: order.id, good_id: good_id) }
end

Admin.create!(email: 'admin@email.com', password: '123456789')
