class Note < ApplicationRecord
  belongs_to :admin

  validates :title,presence:true
  validates :body,presence:true

end
