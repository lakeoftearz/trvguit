class AddPublicinfoToReviews < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :publicinfo, :boolean, default: true
  end
end
