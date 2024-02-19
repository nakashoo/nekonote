class Contact < ApplicationRecord
  belongs_to :customer

   scope :unread, -> { where(admin_read: false) }

  def mark_as_read!
    update(admin_read: true)
  end
end
