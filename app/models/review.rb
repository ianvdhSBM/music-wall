class Review < ActiveRecord::Base

  belongs_to :song
  belongs_to :user

  validates :content, length { maximum: 250 }

end