# coding: utf-8

User.create!(name: "Sample User",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             employee_number: "44490",
             designated_work_start_time: Time.current.change(hour: 8, min: 0, sec: 0),
             designated_work_end_time: Time.current.change(hour: 18, min: 0, sec: 0),             
             admin: true)
             
User.create!(name: "上長１",
             email: "superior-1@email.com",
             password: "password",
             password_confirmation: "password",
             designated_work_start_time: Time.current.change(hour: 8, min: 0, sec: 0),
             designated_work_end_time: Time.current.change(hour: 18, min: 0, sec: 0),
             employee_number: "1111",
             superior: true)
             
User.create!(name: "上長２",
             email: "superior-2@email.com",
             password: "password",
             password_confirmation: "password",
             designated_work_start_time: Time.current.change(hour: 8, min: 0, sec: 0),
             designated_work_end_time: Time.current.change(hour: 18, min: 0, sec: 0),
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
               designated_work_start_time: Time.current.change(hour: 9, min: 0, sec: 0),
               designated_work_end_time: Time.current.change(hour: 18, min: 0, sec: 0),
               password_confirmation: password)
end
