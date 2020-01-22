# coding: utf-8

User.create!(name: "管理者",
             email: "sample@email.com",
             password: "password",
             password_confirmation: "password",
             department: "未登録",
             u_id: "i-1",
             employee_number: "44490",
             admin: true,
            )
             
User.create!(name: "伊藤上長",
             email: "superior-1@email.com",
             password: "password",
             password_confirmation: "password",
             department: "未登録",
             u_id: "i-2",
             employee_number: "1111",
             superior: true)
             
User.create!(name: "田中上長",
             email: "superior-2@email.com",
             password: "password",
             password_confirmation: "password",
             department: "未登録",
             u_id: "i-3",
             employee_number: "2222",
             superior: true)

2.times do |n|
  name = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  employee_number = "#{n+1}"
  User.create!(name: name,
               email: email,
               password: password,
               department: "未登録",
               u_id: "i-1-#{n+100}",
               employee_number: employee_number,
               password_confirmation: password)
               
end
