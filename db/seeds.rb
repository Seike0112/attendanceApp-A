# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "0000",
             admin: true)
             
User.create!(name: "上長１",
             email: "superior-1@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "1111",
             superior: true)
             
User.create!(name: "上長２",
             email: "superior-2@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "2222",
             superior: true)
             

50.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  employee_number = "#{n+1}"
  User.create!(name: name,
               email: email,
               password: password,
               employee_number: employee_number,
               password_confirmation: password)
end
