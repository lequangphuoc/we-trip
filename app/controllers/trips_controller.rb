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
  before_action :get_trip, only: [:edit, :update, :show, :budget_plan, :gallery, :publish]
  before_action :check_member, except: [:show, :new, :available_friends, :create, :publish]
  before_action :prepare_data, only: [:edit, :update, :show]
  before_action :get_budget, only: [:show, :budget_plan]

  def show
  end

  def new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @created = @trip.save
    @trip.user_trips.create(user_id: current_user_id) if @created
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
    respond_to :js
  end

  def gallery
    @albums = GetAlbumService.new(current_user).execute
    @photos = @trip.attachments
    respond_to :js
  end

  def publish
    @trip.update_attributes(is_published: true)
    redirect_to @trip
  end

  private
  def get_trip
    @trip = Trip.find(params[:id])
  end

  def check_member
    redirect_to root_path unless @trip.user_ids.include?(current_user_id)
  end

  def prepare_data
    @schedule_days, @places = ItineraryQuery.new(@trip).execute
  end

  def trip_params
    params.require(:trip).permit(:title, :expected_budget)
  end

  def get_budget
    @budget_sections, @user_with_budgets, @people_in_trip, @total_money = BudgetPlanQuery.new(@trip).execute
  end

  def trip_update_params
    params.require(:trip).permit(
        :title, :description, :expected_budget, :start_date
    )
  end
end
