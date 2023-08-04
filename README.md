# Tea Subscription

- Tea Subscription is a take-home technical challenge. The goal is to create a simple tea subscription back end API with three endpoints:
  
1. An endpoint to subscribe a customer to a tea subscription
2. An endpoint to cancel a customer's tea subscription
3. An endpoint to see all of a customer's subscriptions (active and cancelled)

## Design

After considering various database designs, I settled on a one-to-many relationship between customers and subscriptions. Customers can have many subscriptions but each subscription can have only one customer.

Subscriptions and Teas have a many-to-many relationship through a joins table called subscription_teas. In the case of a real tea-subscription company, I imagine that customers would want to have the option of creating multiple subscriptions, for themselves or for as a gift, which might contain several teas. 

The price of the subscription is calculated using active record in the SubscriptionsSerializer when the json data is created. This leaves open the possibility of adding or removing teas, or changing the quantity of a tea in a subscription and allowing the price to change dynamically with the teas.

The NewSubscriptionFacade was created for the purpose of abstracting bulky logic from the subscriptions#create action.

## Testing

This API reaches 100% coverage as calculated by simplecov. This includes individual test suites for models, facades, serializers, and requests.

There is exhaustive edge-case and sad path testing for a variety of situations.

## Technologies

Tea subscription uses Ruby 3.1.1 and Rails 7.0.6. Testing is done using RSpec and shoulda-matchers, with test coverage calculated using simplecov. Pry is used for debugging and jsonapi-serializer is used to create json serializer classes. 

## Database Schema
![Screenshot 2023-08-04 at 7 52 36 AM](https://github.com/DysonBreakstone/tea_subscription/assets/121531791/124ba66e-468b-4f26-b88f-a5301156bd27)
