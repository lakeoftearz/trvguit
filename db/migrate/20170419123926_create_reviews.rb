class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :content
      t.string :fullname
      t.string :email
      t.string :band
      t.string :country
      t.references :fcomp, foreign_key: true

      t.timestamps
    end
  end
end
