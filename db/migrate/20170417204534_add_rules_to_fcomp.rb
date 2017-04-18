class AddRulesToFcomp < ActiveRecord::Migration[5.0]
  def change
    add_column :fcomps, :rules, :text
  end
end
