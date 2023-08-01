# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
# Add additional requires below this line. Rails is not loaded until this point!

# Requires supporting ruby files with custom matchers and macros, etc, in
# spec/support/ and its subdirectories. Files matching `spec/**/*_spec.rb` are
# run as spec files by default. This means that files in spec/support that end
# in _spec.rb will both be required and run as specs, causing the specs to be
# run twice. It is recommended that you do not name files matching this glob to
# end with _spec.rb. You can configure this pattern with the --pattern
# option on the command line or in ~/.rspec, .rspec or `.rspec-local`.
#
# The following line is provided for convenience purposes. It has the downside
# of increasing the boot-up time by auto-requiring all files in the support
# directory. Alternatively, in the individual `*_spec.rb` files, manually
# require only the support files necessary.
#
# Dir[Rails.root.join('spec', 'support', '**', '*.rb')].sort.each { |f| require f }

# Checks for pending migrations and applies them before tests are run.
# If you are not using ActiveRecord, you can remove these lines.

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  abort e.to_s.strip
end
RSpec.configure do |config|
  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true

  # You can uncomment this line to turn off ActiveRecord support entirely.
  # config.use_active_record = false

  # RSpec Rails can automatically mix in different behaviours to your tests
  # based on their file location, for example enabling you to call `get` and
  # `post` in specs under `spec/controllers`.
  #
  # You can disable this behaviour by removing the line below, and instead
  # explicitly tag your specs with their type, e.g.:
  #
  #     RSpec.describe UsersController, type: :controller do
  #       # ...
  #     end
  #
  # The different available types are documented in the features, such as in
  # https://rspec.info/features/6-0/rspec-rails
  config.infer_spec_type_from_file_location!

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

def test_data
  tea_1 = Tea.create!(title: "One Tea", description: "This tea is One", temperature: 90.1, brew_time: 121)
  tea_2 = Tea.create!(title: "Two Tea", description: "This tea is Two", temperature: 92.2, brew_time: 122)
  tea_3 = Tea.create!(title: "Three Tea", description: "This tea is Three", temperature: 93.3, brew_time: 123)
  tea_4 = Tea.create!(title: "Four Tea", description: "This tea is Four", temperature: 94.4, brew_time: 124)
  tea_5 = Tea.create!(title: "Five Tea", description: "This tea is Five", temperature: 95.5, brew_time: 125)
  tea_6 = Tea.create!(title: "Six Tea", description: "This tea is Six", temperature: 96.6, brew_time: 126)
  tea_7 = Tea.create!(title: "Seven Tea", description: "This tea is Seven", temperature: 97.7, brew_time: 127)
  tea_8 = Tea.create!(title: "Eight Tea", description: "This tea is Eight", temperature: 98.8, brew_time: 128)
  tea_9 = Tea.create!(title: "Nine Tea", description: "This tea is Nine", temperature: 99.9, brew_time: 129)
  tea_10 = Tea.create!(title: "Ten Tea", description: "This tea is Ten", temperature: 100.0, brew_time: 1210)

  customer_1 = Customer.create!(first_name: "One First", last_name: "One Last", email: "Customer@One.com")
  customer_2 = Customer.create!(first_name: "Two First", last_name: "Two Last", email: "Customer@Two.com")
  customer_3 = Customer.create!(first_name: "Three First", last_name: "Three Last", email: "Customer@Three.com")
  customer_4 = Customer.create!(first_name: "Four First", last_name: "Four Last", email: "Customer@Four.com")
  customer_5 = Customer.create!(first_name: "Five First", last_name: "Five Last", email: "Customer@Five.com")

  subscription_1 = Subscription.create!(customer_id: customer_1.id, title: "One's own subscription", status: "active", frequency: 3, teas: {tea_1.id: 1, tea_2.id: 2})
  subscription_1 = Subscription.create!(customer_id: customer_1.id, title: "One's mom", status: "active", frequency: 7, teas: {tea_1.id: 1, tea_2.id: 2, tea_4.id: 3})
  subscription_1 = Subscription.create!(customer_id: customer_2.id, title: "Two's sister", status: "active", frequency: 4, teas: {tea_2.id: 2, tea_3.id: 3})
  subscription_1 = Subscription.create!(customer_id: customer_3.id, title: "Three's weekly", status: "active", frequency: 1, teas: {tea_3.id: 3, tea_4.id: 4})
  subscription_1 = Subscription.create!(customer_id: customer_3.id, title: "Three's Monthly", status: "active", frequency: 8, teas: {tea_3.id: 3, tea_4.id: 4, tea_5.id: 5})
  subscription_1 = Subscription.create!(customer_id: customer_3.id, title: "Three's brother in law", status: "active", frequency: 6, teas: {tea_3.id: 3, tea_4.id: 4, tea_5.id: 5, tea_6.id: 6})
  subscription_1 = Subscription.create!(customer_id: customer_4.id, title: "Four's own subscription", status: "active", frequency: 4, teas: {tea_5.id: 5, tea_6.id: 6})
  subscription_1 = Subscription.create!(customer_id: customer_5.id, title: "Five's family", status: "active", frequency: 3, teas: {tea_5.id: 5, tea_6.id: 6})
  subscription_1 = Subscription.create!(customer_id: customer_5.id, title: "Five's daughter", status: "active", frequency: 10, teas: {tea_5.id: 5, tea_6.id: 6, tea_7.id: 7})
  subscription_1 = Subscription.create!(customer_id: customer_5.id, title: "Five's special collection", status: "active", frequency: 11, teas: {tea_5.id: 5, tea_6.id: 6, tea_7.id: 7, tea_8.id: 8})
  subscription_1 = Subscription.create!(customer_id: customer_6.id, title: "Six's semi-annual tea delivery", status: "active", frequency: 26, teas: {tea_6.id: 6, tea_7.id: 7})
  subscription_1 = Subscription.create!(customer_id: customer_7.id, title: "Seven's quarterly", status: "active", frequency: 13, teas: {tea_7.id: 7, tea_8.id: 8})
  subscription_1 = Subscription.create!(customer_id: customer_7.id, title: "Seven's favorite teas", status: "active", frequency: 6, teas: {tea_7.id: 7, tea_8.id: 8, tea_9.id: 9})
  subscription_1 = Subscription.create!(customer_id: customer_7.id, title: "Seven's estranged son", status: "active", frequency: 9, teas: {tea_7.id: 7, tea_8.id: 8, tea_9.id: 9, tea_10.id: 10})
  subscription_1 = Subscription.create!(customer_id: customer_8.id, title: "Eight's tea biz", status: "active", frequency: 2, teas: {tea_8.id: 8, tea_9.id: 9})
  subscription_1 = Subscription.create!(customer_id: customer_9.id, title: "Nine's super tea recs", status: "active", frequency: 12, teas: {tea_9.id: 9, tea_10.id: 10})
  subscription_1 = Subscription.create!(customer_id: customer_9.id, title: "Nine's least favorite teas", status: "active", frequency: 16, teas: {tea_9.id: 9, tea_10.id: 10, tea_1.id: 1})
  subscription_1 = Subscription.create!(customer_id: customer_10.id, title: "Ten's yearly delivery", status: "active", frequency: 52, teas: {tea_10.id: 10, tea_1.id: 1})
  subscription_1 = Subscription.create!(customer_id: customer_10.id, title: "Ten's 5-week anticipation", status: "active", frequency: 5, teas: {tea_10.id: 10, tea_1.id: 1, tea_2.id: 2})
end
