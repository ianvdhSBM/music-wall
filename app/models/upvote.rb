class Upvote < ActiveRecord::Base

  belongs_to :song
  belongs_to :user

end