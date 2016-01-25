class Song < ActiveRecord::Base

  validates :title,
    presence: true,
    length: { maximum: 50 }

    validates :author,
    presence: true,
    length: { maximum: 50 }

end