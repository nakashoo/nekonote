class Customer < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "guestuser"
      customer.member_ship_year ="guestuser"
    end
  end


  has_one_attached :image

  validates :name, presence: true
  validates :member_ship_year, presence: true

  def get_profile_image
    (image.attached?) ? image : 'default-image.jpeg'
  end

  has_many :contacts, dependent: :destroy

end
