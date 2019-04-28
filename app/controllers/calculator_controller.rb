class CalculatorController < ApplicationController
  def display

    if params[:texto]&&params[:texto].size!=0

      text = params[:calculator][:texto].encode("UTF-8")

      natural_language_understanding = IBMWatson::NaturalLanguageUnderstandingV1.new(
        version: "2018-11-16",
        iam_apikey: "sZ3rzDvR06-X4kHsBtNqb7GUpqEQJ23Jiuf_QYMgxKAL",
        url: "https://gateway.watsonplatform.net/natural-language-understanding/api"
      )

      response = natural_language_understanding.analyze(
        text: text,
        features: {
          categories: {limit:1},
          concepts: {limit:1},
          keywords: {sentiment: true, emotion: true, limit: 1}
        },
        language: "es"
      ).result

      puts response

      if response["concepts"].size!=0
        concepts = response["concepts"].first["text"]

        sentiments = natural_language_understanding.analyze(
          text: text,
          features: {
            sentiment: {targets: [concept]}
          },
          language: "es"
        ).result["sentiment"]
      end

      @keyword = response["keywords"].first["label"]
      if response["entities"]
        @entity = response["entities"].first["text"]
      end

      if sentiments
        @sentiment = sentiments["targets"]["label"]
      end
    end
  end
end
