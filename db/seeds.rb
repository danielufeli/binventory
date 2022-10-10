# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

currencies = [
  {symbol: "USD", rate: 1.00},
  {symbol: "GBP", rate: 0.91},
  {symbol: "EUR", rate: 1.03},
  {symbol: "JOD", rate: 0.71},
  {symbol: "JPY", rate: 145.74},
]

currencies.each do |p| 
 Api::V1::CurrencyRate.create! p 
end
