# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(email: "test_admin@mailinator.com", password: "password", password_confirmation: "password")

Subject.create([{ id: 1,subject_name: "English" },{ id: 2,subject_name: "Telugu" },{ id: 3,subject_name: "Hindi" },{ id: 4,subject_name: "Maths" }])

