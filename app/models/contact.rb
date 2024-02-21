class Contact < ApplicationRecord
  belongs_to :customer

  validates :title,presence:true
  validates :body,presence:true


   scope :unread, -> { where(admin_read: false) }

  def mark_as_read!
    update(admin_read: true)
  end
end
