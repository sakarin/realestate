require 'spork'

Spork.prefork do
  # Loading more in this block will cause your tests to run faster. However, 
  # if you change any configuration or code from libraries loaded here, you'll
  # need to restart spork for it take effect.
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require 'email_spec'
  require 'capybara/rspec'

  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

  # -----------------------------------------------------------------------------
  # See https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
  # -----------------------------------------------------------------------------
  include Warden::Test::Helpers
  Warden.test_mode!


  RSpec.configure do |config|
    config.before(:each) do
      begin
        Capybara.current_session.driver.browser.manage.window.resize_to(1920, 1080)
      rescue

      end
    end

    config.include(EmailSpec::Helpers)
    config.include(EmailSpec::Matchers)

    config.mock_with :rspec

    config.infer_base_class_for_anonymous_controllers = false

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # -----------------------------------------------------------------------------
    # If your login works using Capybara/Rack::Test, but not in Capybara/Selenium
    # See https://github.com/plataformatec/devise/wiki/How-To:-Test-with-Capybara
    # -----------------------------------------------------------------------------
    config.use_transactional_fixtures = false

    config.before(:suite) do
      DatabaseCleaner.strategy = :truncation
    end
    config.before(:each) do
      DatabaseCleaner.start
    end
    config.after(:each) do
      DatabaseCleaner.clean
    end
  end




end

Spork.each_run do

end
