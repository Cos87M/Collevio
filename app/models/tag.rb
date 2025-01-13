class Tag < ApplicationRecord
  # A tag belongs to a photo and a kid
  belongs_to :photo
  belongs_to :kid
end
