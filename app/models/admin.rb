class Admin < ApplicationRecord

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


   validates :name, presence: true
   validates :responsible, presence: true

  has_one_attached :image

end
