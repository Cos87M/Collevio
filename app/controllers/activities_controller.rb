class ActivitiesController < ApplicationController
  # Sets the @activity instance variable before performing certain actions
  before_action :set_activity, only: %i[show edit update destroy]

  # Displays a list of activities and their associated attributes
  def index
    # Fetches all activities scoped to the current user's policies, ordered by creation date (most recent first)
    @activities = policy_scope(Activity).order(created_at: :desc)
    # Extracts nap durations, orders them chronologically, and selects the last five in reverse order
    @naps = @activities.order(created_at: :asc).map(&:nap_duration)
    @five_naps = @naps.first(5).reverse
    # Extracts bowel movement data and selects the last five in reverse order
    @bowels = @activities.map(&:bowel_movement)
    @five_bowels = @bowels.first(5).reverse
    # Extracts overall mood data and selects the last five in reverse order
    @moods = @activities.map(&:overall_mood)
    @five_moods = @moods.first(5).reverse
    # Extracts dates of activities and formats them for display
    @dates = @activities.map(&:date)
    # Extracts snack and lunch consumption data
    @snack_consumption = @activities.map(&:snack_consumption)
    @lunch_consumption = @activities.map(&:lunch_consumption)
    # Formats the first five dates for display (e.g., "Fri 10") and reverses the order
    @map_five_dates = @dates.first(5).map do |date|
      date.strftime("%a %d") # Format: Day and day of the month
      # date.strftime("%Y-%m-%d")
    end

    @five_dates = @map_five_dates.reverse
    # Selects the last five snack and lunch consumption records in reverse order
    @five_snack_consumption = @snack_consumption.first(5).reverse
    @five_lunch_consumption = @lunch_consumption.first(5).reverse
    # @five_snack_consumption = @
    # @values = {naps: @naps, bowels: @bowels, moods: @moods, food_consumption: @food_consumption}
  end
  # Displays a single activity
  def show

  end
  # Initializes a new activity
  def new
    # @activity = Activity.new
    # authorize @activity
  end
  # Creates a new activity record 
  def create
    # @activity = Activity.new
    # @activity.user = @activity  # Assigns the activity to the current user

    # authorize @activity
  end

  private
  # Finds the activity by ID and ensures the user is authorized to access it
  def set_activity
    @activity = Activity.find(params[:id])
    authorize @activity
  end

end
