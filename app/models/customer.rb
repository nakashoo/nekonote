class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image

  validates :name, presence: true
  validates :member_ship_year, presence: true

  def get_profile_image
    (image.attached?) ? image : 'default-image.jpeg'
  end

  has_many :notes

end
