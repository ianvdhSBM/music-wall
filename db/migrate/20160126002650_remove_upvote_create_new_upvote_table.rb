class RemoveUpvoteCreateNewUpvoteTable < ActiveRecord::Migration
  def change
    remove_column :songs, :upvote

    create_table :upvotes do |t|
      t.references :song
      t.references :user
    end

  end
end
