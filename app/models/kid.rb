class Kid < ApplicationRecord
  # A kid can have many chatrooms, tags, photos through tags, parents, rooms, and activities
  has_many :chatrooms, dependent: :destroy
  has_many :tags, dependent: :destroy
  has_many :photos, through: :tags, dependent: :destroy
  has_many :parents, dependent: :destroy
  has_many :rooms, dependent: :destroy
  has_many :activities, dependent: :destroy

  # Attach a photo file to the Kid model
  has_one_attached :photo
end
