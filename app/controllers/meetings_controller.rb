class MeetingsController < ApplicationController

  # Displays a list of meetings within a specific date range
  def index
    # Fetches all meetings the current user is authorized to access, based on Pundit policies
    @meetings = policy_scope(Meeting)

    # Retrieves the `start_date` from the URL parameters (defaults to today's date if not provided)
    start_date = params.fetch(:start_date, Date.today).to_date

    # Filters meetings where the start time is within the specified range (current month's start to the current month's end)
    # It finds meetings within the week of the start date, starting from the beginning of the week to the end of the week.
    @meetings = Meeting.where(start_time:
      start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
  end
end
