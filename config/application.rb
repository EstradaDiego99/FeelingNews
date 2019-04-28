require_relative 'boot'

require 'rails/all'
require 'csv'
require "json"
require "ibm_watson/natural_language_understanding_v1"
include IBMWatson

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FeelingNews
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    $natural_language_understanding = IBMWatson::NaturalLanguageUnderstandingV1.new(
      version: "2018-11-16",
      iam_apikey: "sZ3rzDvR06-X4kHsBtNqb7GUpqEQJ23Jiuf_QYMgxKAL",
      url: "https://gateway.watsonplatform.net/natural-language-understanding/api"
    )

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
