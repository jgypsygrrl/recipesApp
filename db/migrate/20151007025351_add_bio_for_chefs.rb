class AddBioForChefs < ActiveRecord::Migration
  def change
    add_column :chefs, :bio, :text
  end
end
