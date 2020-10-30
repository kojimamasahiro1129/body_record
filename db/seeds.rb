# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"

foods_csv = CSV.readlines("db/foods.csv")
foods_csv.shift
foods_csv.each do |row|
  Food.create(name: row[1],calorie: row[2])
end

mets_csv =CSV.readlines("db/mets.csv")
mets_csv.shift
mets_csv.each do |row|
    CaloriesBurned.create(name: row[1],mets: row[2])
end

time_csv =CSV.readlines("db/time.csv")
time_csv.shift
time_csv.each do |row|
    ActivityTime.create(time: row[1])
end