# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
RSSGatherSite::Application.initialize!

# Adding the below makes it work as expected at heroku
Rails::Initializer.run do | config |
  config.i18n.default_locale = :ja
  config.i18n.locale = :ja
end
