class CreateFcomps < ActiveRecord::Migration[5.0]
  def change
    create_table :fcomps do |t|
      t.string :name
      t.string :country
      t.string :webpage
      t.string :logo

      t.timestamps
    end
  end
end
