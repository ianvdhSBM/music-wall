class User < ActiveRecord::Base

  has_many :songs
  has_many :upvotes
  has_many :reviews

  validates :username,
    presence: true,
    uniqueness: true,
    length: { maximum: 50 }

    validates :password,
    presence: true,
    length: { maximum: 50 }

end