class Admin < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   validates :name, presence: true
   validates :responsible, presence: true

  has_one_attached :image

  def get_profile_image
    (image.attached?) ? image : 'default-image.jpeg'
  end

  has_many :notes
  has_many :links

end
