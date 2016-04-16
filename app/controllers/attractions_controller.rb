class AttractionsController < ApplicationController
  before_action :require_login
  before_action :get_schedule_day, only: [:destroy]

  def create
    @attraction = CreateAttractionService.new(params).execute
    respond_to :js
  end

  def destroy
    DestroyAttractionService.new(params).execute
    respond_to :js
  end

  private
  def get_schedule_day
    @schedule_day = ScheduleDay.find(params[:schedule_day_id]).decorate
  end
end
