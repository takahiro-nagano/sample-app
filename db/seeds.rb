# coding: utf-8

User.create!( name: "Sample User",
              email: "sample@email.com",
              password: "password",
              password_confirmation: "password",
              admin: true)
User.create!( name: "Sample2 User",
              email: "sample2@email.com",
              password: "password",
              password_confirmation: "password",
              )        
User.create!( name: "Sample3 User",
              email: "sample3@email.com",
              password: "password",
              password_confirmation: "password",
              )        
        
    
    
              
10.times do |n|
  name  = Faker::Name.name
  email = "sample-#{n+1}@email.com"
  password = "password"
  User.create!(name: name,
               email: email,
               password: password,
               password_confirmation: password)
end