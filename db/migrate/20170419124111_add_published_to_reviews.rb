class AddPublishedToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :published, :boolean, default: false
  end
end
