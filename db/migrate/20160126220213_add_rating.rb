class AddRating < ActiveRecord::Migration
  def change
    add_column :reviews, :rating, :integer, :default => 0
  end
end
