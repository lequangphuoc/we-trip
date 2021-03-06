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
  before_action :require_login, except: [:show]
  before_action :get_trip, except: [:new, :create, :available_friends]
  before_action :check_member, except: [:show, :new, :available_friends, :create, :clone]
  before_action :get_itinerary, only: [:edit, :update, :show, :itinerary]
  before_action :get_budget, only: [:show, :budget_plan]

  def show
    unless @trip.user_ids.include?(current_user_id)
      CalculatePointsService.new(@trip).add_point_by_trip('view')
    end
  end

  def edit
    if @trip.id != current_trip
      set_current_trip(@trip.id)
      set_current_screen(nil)
    end
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

  # user edit
  def itinerary
    respond_to :js
  end

  def budget_plan
    respond_to :js
  end

  def basic_info
    respond_to :js
  end

  def gallery
    @albums = GetAlbumService.new(current_user).execute
    @has_provider = current_user.providers.where(name: 'facebook').count > 0
    @photos = @trip.attachments
    respond_to :js
  end

  # user interact
  def publish
    @trip.update_attributes(is_published: true)
    CalculatePointsService.new(@trip).add_point_by_trip('published')
    redirect_to @trip
  end

  def clone
    new_trip = CloneTripService.new(@trip, current_user).execute
    redirect_to edit_trip_path(new_trip)
  end

  #search
  def get_possible_destination
    @regions = Region.get_starting_regions
    render json: @regions
  end

  private
  def get_trip
    @trip = Trip.find(params[:id])
  end

  def check_member
    redirect_to root_path unless @trip.user_ids.include?(current_user_id)
  end

  def get_itinerary
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
