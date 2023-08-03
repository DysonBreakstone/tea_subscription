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

require 'simplecov'
SimpleCov.start

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
  @tea_1 = Tea.create!(title: "One Tea", description: "This tea is One", temperature: 90.1, brew_time: 121, price: 1.00)
  @tea_2 = Tea.create!(title: "Two Tea", description: "This tea is Two", temperature: 92.2, brew_time: 122, price: 2.00)
  @tea_3 = Tea.create!(title: "Three Tea", description: "This tea is Three", temperature: 93.3, brew_time: 123, price: 3.00)
  @tea_4 = Tea.create!(title: "Four Tea", description: "This tea is Four", temperature: 94.4, brew_time: 124, price: 4.00)
  @tea_5 = Tea.create!(title: "Five Tea", description: "This tea is Five", temperature: 95.5, brew_time: 125, price: 5.00)
  @tea_6 = Tea.create!(title: "Six Tea", description: "This tea is Six", temperature: 96.6, brew_time: 126, price: 6.00)
  @tea_7 = Tea.create!(title: "Seven Tea", description: "This tea is Seven", temperature: 97.7, brew_time: 127, price: 7.00)
  @tea_8 = Tea.create!(title: "Eight Tea", description: "This tea is Eight", temperature: 98.8, brew_time: 128, price: 8.00)
  @tea_9 = Tea.create!(title: "Nine Tea", description: "This tea is Nine", temperature: 99.9, brew_time: 129, price: 9.00)
  @tea_10 = Tea.create!(title: "Ten Tea", description: "This tea is Ten", temperature: 100.0, brew_time: 1210, price: 10.00)
  @tea_11 = Tea.create!(title: "Eleven Tea", description: "This tea is Eleven", temperature: 111.0, brew_time: 1211, price: 11.00)
  @tea_12 = Tea.create!(title: "Twelve Tea", description: "This tea is Twelve", temperature: 112.0, brew_time: 1212, price: 12.00)
  @tea_13 = Tea.create!(title: "Thirteen Tea", description: "This tea is Thirteen", temperature: 113.0, brew_time: 1213, price: 13.00)

  @customer_1 = Customer.create!(first_name: "One First", last_name: "One Last", email: "Customer@One.com")
  @customer_2 = Customer.create!(first_name: "Two First", last_name: "Two Last", email: "Customer@Two.com")
  @customer_3 = Customer.create!(first_name: "Three First", last_name: "Three Last", email: "Customer@Three.com")
  @customer_4 = Customer.create!(first_name: "Four First", last_name: "Four Last", email: "Customer@Four.com")
  @customer_5 = Customer.create!(first_name: "Five First", last_name: "Five Last", email: "Customer@Five.com")
  @customer_6 = Customer.create!(first_name: "Six First", last_name: "Six Last", email: "Customer@Six.com")
  @customer_7 = Customer.create!(first_name: "Seven First", last_name: "Seven Last", email: "Customer@Seven.com")
  @customer_8 = Customer.create!(first_name: "Eight First", last_name: "Eight Last", email: "Customer@Eight.com")
  @customer_9 = Customer.create!(first_name: "Nine First", last_name: "Nine Last", email: "Customer@Nine.com")
  @customer_10 = Customer.create!(first_name: "Ten First", last_name: "Ten Last", email: "Customer@Ten.com")

  @subscription_1 = Subscription.create!(customer_id: @customer_1.id, title: "One's own subscription", status: true, frequency: 3)
  @subscription_2 = Subscription.create!(customer_id: @customer_1.id, title: "One's mom", status: true, frequency: 7)
  @subscription_3 = Subscription.create!(customer_id: @customer_2.id, title: "Two's sister", status: true, frequency: 4)
  @subscription_4 = Subscription.create!(customer_id: @customer_3.id, title: "Three's weekly", status: false, frequency: 1)
  @subscription_5 = Subscription.create!(customer_id: @customer_3.id, title: "Three's Monthly", status: true, frequency: 8)
  @subscription_6 = Subscription.create!(customer_id: @customer_3.id, title: "Three's brother in law", status: true, frequency: 6)
  @subscription_7 = Subscription.create!(customer_id: @customer_4.id, title: "Four's own subscription", status: true, frequency: 4)
  @subscription_8 = Subscription.create!(customer_id: @customer_5.id, title: "Five's family", status: true, frequency: 3)
  @subscription_9 = Subscription.create!(customer_id: @customer_5.id, title: "Five's daughter", status: false, frequency: 10)
  @subscription_10 = Subscription.create!(customer_id: @customer_5.id, title: "Five's special collection", status: true, frequency: 11)
  @subscription_11 = Subscription.create!(customer_id: @customer_6.id, title: "Six's semi-annual tea delivery", status: true, frequency: 26)
  @subscription_12 = Subscription.create!(customer_id: @customer_7.id, title: "Seven's quarterly", status: true, frequency: 13)
  @subscription_13 = Subscription.create!(customer_id: @customer_7.id, title: "Seven's favorite teas", status: true, frequency: 6)
  @subscription_14 = Subscription.create!(customer_id: @customer_7.id, title: "Seven's estranged son", status: false, frequency: 9)
  @subscription_15 = Subscription.create!(customer_id: @customer_8.id, title: "Eight's tea biz", status: true, frequency: 2)
  @subscription_16 = Subscription.create!(customer_id: @customer_9.id, title: "Nine's super tea recs", status: false, frequency: 12)
  @subscription_17 = Subscription.create!(customer_id: @customer_9.id, title: "Nine's least favorite teas", status: true, frequency: 16)
  @subscription_18 = Subscription.create!(customer_id: @customer_10.id, title: "Ten's yearly delivery", status: true, frequency: 52)
  @subscription_19 = Subscription.create!(customer_id: @customer_10.id, title: "Ten's 5-week anticipation", status: true, frequency: 5)

  @subscription_tea_1 = SubscriptionTea.create!(subscription_id: @subscription_1.id, tea_id: @tea_1.id, quantity: 1)
  @subscription_tea_2 = SubscriptionTea.create!(subscription_id: @subscription_1.id, tea_id: @tea_2.id, quantity: 2)

  @subscription_tea_3 = SubscriptionTea.create!(subscription_id: @subscription_2.id, tea_id: @tea_1.id, quantity: 1)
  @subscription_tea_4 = SubscriptionTea.create!(subscription_id: @subscription_2.id, tea_id: @tea_2.id, quantity: 2)
  @subscription_tea_5 = SubscriptionTea.create!(subscription_id: @subscription_2.id, tea_id: @tea_3.id, quantity: 3)

  @subscription_tea_6 = SubscriptionTea.create!(subscription_id: @subscription_3.id, tea_id: @tea_2.id, quantity: 2)
  @subscription_tea_7 = SubscriptionTea.create!(subscription_id: @subscription_3.id, tea_id: @tea_3.id, quantity: 3)

  @subscription_tea_8 = SubscriptionTea.create!(subscription_id: @subscription_4.id, tea_id: @tea_3.id, quantity: 3)
  @subscription_tea_9 = SubscriptionTea.create!(subscription_id: @subscription_4.id, tea_id: @tea_4.id, quantity: 4)

  @subscription_tea_10 = SubscriptionTea.create!(subscription_id: @subscription_4.id, tea_id: @tea_3.id, quantity: 3)
  @subscription_tea_11 = SubscriptionTea.create!(subscription_id: @subscription_4.id, tea_id: @tea_4.id, quantity: 4)
  @subscription_tea_12 = SubscriptionTea.create!(subscription_id: @subscription_4.id, tea_id: @tea_5.id, quantity: 5)

  @subscription_tea_13 = SubscriptionTea.create!(subscription_id: @subscription_5.id, tea_id: @tea_3.id, quantity: 3)
  @subscription_tea_14 = SubscriptionTea.create!(subscription_id: @subscription_5.id, tea_id: @tea_4.id, quantity: 4)
  @subscription_tea_15 = SubscriptionTea.create!(subscription_id: @subscription_5.id, tea_id: @tea_5.id, quantity: 5)
  @subscription_tea_16 = SubscriptionTea.create!(subscription_id: @subscription_5.id, tea_id: @tea_6.id, quantity: 6)

  @subscription_tea_17 = SubscriptionTea.create!(subscription_id: @subscription_6.id, tea_id: @tea_4.id, quantity: 4)
  @subscription_tea_18 = SubscriptionTea.create!(subscription_id: @subscription_6.id, tea_id: @tea_5.id, quantity: 5)

  @subscription_tea_19 = SubscriptionTea.create!(subscription_id: @subscription_7.id, tea_id: @tea_5.id, quantity: 5)
  @subscription_tea_20 = SubscriptionTea.create!(subscription_id: @subscription_7.id, tea_id: @tea_6.id, quantity: 6)

  @subscription_tea_21 = SubscriptionTea.create!(subscription_id: @subscription_8.id, tea_id: @tea_5.id, quantity: 5)
  @subscription_tea_22 = SubscriptionTea.create!(subscription_id: @subscription_8.id, tea_id: @tea_6.id, quantity: 6)
  @subscription_tea_23 = SubscriptionTea.create!(subscription_id: @subscription_8.id, tea_id: @tea_7.id, quantity: 7)

  @subscription_tea_24 = SubscriptionTea.create!(subscription_id: @subscription_9.id, tea_id: @tea_5.id, quantity: 5)
  @subscription_tea_25 = SubscriptionTea.create!(subscription_id: @subscription_9.id, tea_id: @tea_6.id, quantity: 6)
  @subscription_tea_26 = SubscriptionTea.create!(subscription_id: @subscription_9.id, tea_id: @tea_7.id, quantity: 7)
  @subscription_tea_27 = SubscriptionTea.create!(subscription_id: @subscription_9.id, tea_id: @tea_8.id, quantity: 8)

  @subscription_tea_28 = SubscriptionTea.create!(subscription_id: @subscription_10.id, tea_id: @tea_6.id, quantity: 6)
  @subscription_tea_29 = SubscriptionTea.create!(subscription_id: @subscription_10.id, tea_id: @tea_7.id, quantity: 7)

  @subscription_tea_30 = SubscriptionTea.create!(subscription_id: @subscription_11.id, tea_id: @tea_7.id, quantity: 7)
  @subscription_tea_31 = SubscriptionTea.create!(subscription_id: @subscription_11.id, tea_id: @tea_8.id, quantity: 8)

  @subscription_tea_32 = SubscriptionTea.create!(subscription_id: @subscription_12.id, tea_id: @tea_7.id, quantity: 7)
  @subscription_tea_33 = SubscriptionTea.create!(subscription_id: @subscription_12.id, tea_id: @tea_8.id, quantity: 8)
  @subscription_tea_34 = SubscriptionTea.create!(subscription_id: @subscription_12.id, tea_id: @tea_9.id, quantity: 9)

  @subscription_tea_35 = SubscriptionTea.create!(subscription_id: @subscription_13.id, tea_id: @tea_7.id, quantity: 7)
  @subscription_tea_36 = SubscriptionTea.create!(subscription_id: @subscription_13.id, tea_id: @tea_8.id, quantity: 8)
  @subscription_tea_37 = SubscriptionTea.create!(subscription_id: @subscription_13.id, tea_id: @tea_9.id, quantity: 9)
  @subscription_tea_38 = SubscriptionTea.create!(subscription_id: @subscription_13.id, tea_id: @tea_10.id, quantity: 10)

  @subscription_tea_39 = SubscriptionTea.create!(subscription_id: @subscription_14.id, tea_id: @tea_8.id, quantity: 8)
  @subscription_tea_40 = SubscriptionTea.create!(subscription_id: @subscription_14.id, tea_id: @tea_9.id, quantity: 9)

  @subscription_tea_41 = SubscriptionTea.create!(subscription_id: @subscription_15.id, tea_id: @tea_9.id, quantity: 9)
  @subscription_tea_42 = SubscriptionTea.create!(subscription_id: @subscription_15.id, tea_id: @tea_10.id, quantity: 10)

  @subscription_tea_43 = SubscriptionTea.create!(subscription_id: @subscription_16.id, tea_id: @tea_9.id, quantity: 9)
  @subscription_tea_44 = SubscriptionTea.create!(subscription_id: @subscription_16.id, tea_id: @tea_10.id, quantity: 10)
  @subscription_tea_45 = SubscriptionTea.create!(subscription_id: @subscription_16.id, tea_id: @tea_11.id, quantity: 11)

  @subscription_tea_46 = SubscriptionTea.create!(subscription_id: @subscription_17.id, tea_id: @tea_10.id, quantity: 10)
  @subscription_tea_47 = SubscriptionTea.create!(subscription_id: @subscription_17.id, tea_id: @tea_11.id, quantity: 11)

  @subscription_tea_48 = SubscriptionTea.create!(subscription_id: @subscription_18.id, tea_id: @tea_10.id, quantity: 10)
  @subscription_tea_49 = SubscriptionTea.create!(subscription_id: @subscription_18.id, tea_id: @tea_11.id, quantity: 11)
  @subscription_tea_50 = SubscriptionTea.create!(subscription_id: @subscription_18.id, tea_id: @tea_12.id, quantity: 12)

  @subscription_tea_51 = SubscriptionTea.create!(subscription_id: @subscription_19.id, tea_id: @tea_10.id, quantity: 10)
  @subscription_tea_52 = SubscriptionTea.create!(subscription_id: @subscription_19.id, tea_id: @tea_11.id, quantity: 11)
  @subscription_tea_53 = SubscriptionTea.create!(subscription_id: @subscription_19.id, tea_id: @tea_12.id, quantity: 12)
  @subscription_tea_54 = SubscriptionTea.create!(subscription_id: @subscription_19.id, tea_id: @tea_13.id, quantity: 13)
end
