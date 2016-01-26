class Song < ActiveRecord::Base

  belongs_to :user
  has_many :upvotes

  validates :title,
    presence: true,
    length: { maximum: 50 }

    validates :author,
      presence: true,
      length: { maximum: 50 }

    validates :url,
      presence: true

end