class PhotosController < ApplicationController
  # Displays the form for creating a new photo
  def new
    # Initializes a new Photo object
    @photo = Photo.new
    # Authorizes the action using Pundit (ensures the user has permission to access this action)
    authorize @photo
  end

  # Handles the creation of a new photo
  def create
    # Initializes a new Photo object with the submitted parameters
    @photo = Photo.new(photo_params)
    # Authorizes the action using Pundit (checks if the user has permission to create a photo)
    authorize @photo
    # Saves the new photo to the database
    @photo.save
    # Redirects the user to the photos index page after successful creation
    redirect_to photos_path
  end

  # Displays a list of photos
  def index
    # Fetches all photos that the current user is authorized to view, based on Pundit policy
    @photos = policy_scope(Photo)
    # Initializes a new Photo object for potential creation directly from the index page
    @photo = Photo.new
  end

  # Handles the deletion of a photo
  def destroy
    # Finds the photo to be deleted using the ID from the URL parameters
    @photo = Photo.find(params[:id])
    # Authorizes the action using Pundit (checks if the user has permission to delete this photo)
    authorize @photo
    # Delete the photo from the database
    @photo.destroy
    # Redirects the user back to the photos index page after deletion
    # `status: :see_other` sends a 303 HTTP status code, indicating the resource has been deleted
    redirect_to photos_path, status: :see_other
  end

    private
    # Strong parameters: Defines the allowed parameters for creating/updating a photo
    def photo_params
      # Permits only the `photo` attribute to prevent mass-assignment vulnerabilities
      params.require(:photo).permit(:photo)
    end
end
