class Admin < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def self.guest
    find_or_create_by(email: 'admin@example.com') do |admin|
      admin.password = SecureRandom.urlsafe_base64
      admin.name = "guestuser"
      admin.responsible ="guestuser"
    end
  end


  validates :name, presence: true
  validates :responsible, presence: true

  has_one_attached :image

  def get_profile_image
    (image.attached?) ? image : aseet_path('default-image.jpeg')
  end

  has_many :notes, dependent: :destroy
  has_many :links, dependent: :destroy

end
