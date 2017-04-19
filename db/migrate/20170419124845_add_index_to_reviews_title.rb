class AddIndexToReviewsTitle < ActiveRecord::Migration[5.0]
  def change
    add_index :reviews, [:title, :created_at]
  end
end
