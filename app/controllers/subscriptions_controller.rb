class SubscriptionsController < ApplicationController
  before_action :set_plan, :set_user
  after_action :set_payment, only: %i[create]

  def index
  end

  def show
  end

  def new
    @subscription = Subscription.new
  end

  def create
    @subscription = Subscription.new(plan_id: @plan.id, user_id: @user.id)
    respond_to do |format|
      if @subscription.save
        format.html { redirect_to user_plans_path(@user) }
        format.json { render :show, status: :created, location: @subscription }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @plan.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
  end

  private

  def set_payment
    @payments = Payment.new
    @billing_day = Date.today
    @payments.update(payment: @plan.monthly_fee,
                     billing_day: @billing_day, user_id: @user.id)
  end

  def set_plan
    @plan = Plan.find(params[:plan_id])
  end

  def set_user
    @user = current_user
  end

  def plan_params
    params.require(:subscription).permit(:plan_id)
  end
end
