class Review < ActiveRecord::Base

  belongs_to :song
  belongs_to :user

  validates :content, 
    presence: true,
    length: { maximum: 250 }

end