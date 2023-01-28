class Book < ApplicationRecord
  belongs_to :user

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end