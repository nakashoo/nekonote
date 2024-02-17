class Contact < ApplicationRecord
  belongs_to :customer

   scope :unread, -> { where(admin_read: true) }

  def mark_as_read!
    update(admin_read: false)
  end
end
