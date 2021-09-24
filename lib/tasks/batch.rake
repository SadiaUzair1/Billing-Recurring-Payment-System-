# frozen_string_literal: true

namespace :batch do
  desc 'Sending emails to ask for payment of plans'
  task send_payment_emails: :environment do
    users = User.all
    users.each do |user|
      next unless user.billing_date + 1.month == Time.zone.today

      @user = user
      PaymentMailer.with(user: @user).payment_reminder.deliver_now
    end
  end
end
