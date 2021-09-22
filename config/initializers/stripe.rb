# frozen_string_literal: true

Rails.configuration.stripe = {
  publishable_key: Rails.application.secrets.stripe_publishable_key,
  secret_key: Rails.application.secrets.stripe_secret_key
}
Stripe.api_key = ENV['stripe_secret_key']
