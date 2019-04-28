# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require "json"
require "ibm_watson/natural_language_understanding_v1"

include IBMWatson

natural_language_understanding = IBMWatson::NaturalLanguageUnderstandingV1.new(
  version: "2018-11-16",
  iam_apikey: "sZ3rzDvR06-X4kHsBtNqb7GUpqEQJ23Jiuf_QYMgxKAL",
  url: "https://gateway.watsonplatform.net/natural-language-understanding/api"
)

# Posts.delete_all
route = File.join(Rails.root, 'public', 'files', 'tweets.csv')
posts_vanilla = CSV.read(route, encoding: "ISO-8859-1:UTF-8")

posts_vanilla.each do |post|
  # puts post[6]
  response = natural_language_understanding.analyze(
    text: post[6],
    features: {
      categories: {limit:1},
      concepts: {limit:3},
      keywords: {sentiment: true, emotion: true, limit: 3},
      entities: {sentiment: true, limit: 1}
    },
    language: "es"
  )

  puts response.result["concepts"]
  puts response.result["categories"]
  puts response.result["keywords"]
  puts response.result["entities"]
  puts ""

end
