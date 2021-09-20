# frozen_string_literal: true

namespace :batch do
  desc 'Sending emails to ask for payment of plans'
  task send_payment_emails: :environment do
    payments = Payment.all
    payments.each do |payment|
      next unless payment.next_billing_day == Time.zone.today

      @user = User.find_by(id: payment.user_id)
      PaymentMailer.with(user: @user).payment_reminder.deliver_now
      payment.update(status: 0)
      @user.subscriptions[payment.plan_id].update(status: 0)
    end
  end
end
