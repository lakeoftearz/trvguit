class AddColumnsToReview < ActiveRecord::Migration[5.0]
  def change
    add_column :reviews, :rtg1, :integer
    add_column :reviews, :rtg2, :integer
    add_column :reviews, :rtg3, :integer
    add_column :reviews, :rtg4, :integer
    add_column :reviews, :rtg5, :integer
  end
end
