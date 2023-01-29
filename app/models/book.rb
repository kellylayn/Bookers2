class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :opinion, presence: true

  def get_profile_image
    (profile_image.attached?) ? profile_image : 'no_image.jpg'
  end
end