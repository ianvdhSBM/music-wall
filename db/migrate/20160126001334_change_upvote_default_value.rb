class ChangeUpvoteDefaultValue < ActiveRecord::Migration
  def change
    change_column :songs, :upvote, :integer, :default => 0
  end
end
