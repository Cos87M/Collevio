class MeetingsController < ApplicationController

  def index
    @meetings = policy_scope(Meeting)
    start_date = params.fetch(:start_date, Date.today).to_date

    @meetings = Meeting.where(start_time:
      start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
