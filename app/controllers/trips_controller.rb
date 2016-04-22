# == Schema Information
#
# Table name: trips
#
#  id              :integer          not null, primary key
#  start_date      :datetime
#  departure_id    :integer
#  title           :string
#  description     :text
#  expected_budget :decimal(, )
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class TripsController < ApplicationController
  before_action :require_login
  before_action :get_trip, only: [:edit, :update, :show, :budget_plan]
  before_action :prepare_data, only: [:edit, :update]

  def show
  end

  def new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @created = @trip.save
    respond_to :js
  end

  def update
    @trip.departure = Region.find_by(name: params[:trip][:departure])
    @updated = @trip.update_attributes(trip_update_params)
    respond_to :js
  end

  def available_friends
    render json: current_user.friends_not_in_trip(params[:id])
  end

  def budget_plan
    @budget_sections = @trip.budget_sections.preload(
        :schedule_day, :budget_items => {:user_budgets => :user}
    ).decorate
    @people_in_trip = @trip.users
    @user_with_budgets = @trip.users.preload(:user_budgets => :budget_item)
                             .where(user_budgets: {id: @trip.user_budget_ids}).decorate
    respond_to :js
  end

  private
  def get_trip
    @trip = Trip.find(params[:id])
  end

  def prepare_data
    @schedule_days = @trip.schedule_days.preload(:attractions => {:place => :display_photo}).decorate
    @places = Place.all.preload(:region, :display_photo).decorate
  end

  def trip_params
    params.require(:trip).permit(:title, :expected_budget)
  end

  def trip_update_params
    params.require(:trip).permit(
        :title, :description, :expected_budget, :start_date
    )
  end
end
