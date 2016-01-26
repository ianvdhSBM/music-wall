class AddReviewsTable < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references    :song
      t.references    :user 
      t.string        :content
      
      t.timestamps null: false
    end
  end
end
