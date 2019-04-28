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

language_translator = IBMWatson::LanguageTranslatorV3.new(
  version: "2018-05-01",
  iam_apikey: "M9EJLOm_js8OMqdMK36jesM6bt9BpBLmDEkFIkC7lQbJ",
  url:"https://gateway.watsonplatform.net/language-translator/api"
)

route = File.join(Rails.root, 'public', 'files', 'tweets.csv')
posts_vanilla = CSV.read(route, encoding: "ISO-8859-1:UTF-8")

# Posts.delete_all

posts_vanilla.each do |post|

  next if post[6]=="no"

  text = post[7]

  response = natural_language_understanding.analyze(
    text: text,
    features: {
      categories: {limit:1},
      concepts: {limit:1},
      keywords: {sentiment: true, emotion: true, limit: 3},
      entities: {sentiment: true, limit: 3}
    },
    language: "es"
  ).result

  if response["concepts"].size!=0
    concept = response["concepts"].first["text"]
    concept_score = response["concepts"].first["relevance"]
  else
    concept = nil
    concept_score = nil
  end
  if response["categories"].size!=0
    category = response["categories"].first["label"]
    category_score = response["categories"].first["score"]
  else
    category = nil
    category_score = nil
  end
  keywords = response["keywords"]
  entities = response["entities"]

  keywords.each do |keyword|
    entities.each do |entity|
      if post[6]=="no"
        parent = Post.create!(
          texto: text,
          favs: post[3],
          hashtags: nil,
          shares: nil,
          tags: nil,
          concept: concept,
          concept_score: concept_score,
          keyword: keyword["text"],
          keyword_score: keyword["relevance"],
          category: category,
          category_score: category_score,
          entity: entity["text"],
          entity_score: entity["relevance"]
        )
      else
        begin
          sentiment = natural_language_understanding.analyze(
            text: text,
            features: {
              sentiment: {targets: [parent.concept]}
            },
            language: "es"
          ).result["sentiment"]["targets"].first
          puts sentiment
          sentiment = sentiment["label"]
          sentiment_score = sentiment["score"]
        rescue
          sentiment = nil
          sentiment_score = nil
        end
        Comment.create!(
          texto: text,
          favs: post[3],
          sentiment: sentiment,
          sentiment_score: sentiment_score
        )
      end
    end
  end

end
