class AttractionsController < ApplicationController
  before_action :require_login

  def create
    respond_to :js
  end

  def destroy
    DestroyAttractionService.new(params).execute
    get_schedule_day
    respond_to :js
  end

  private
  def get_schedule_day
    @schedule_day = ScheduleDay.find(params[:schedule_day_id]).decorate
  end
end
