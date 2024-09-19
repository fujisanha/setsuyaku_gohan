class AddUserIdToRecipes < ActiveRecord::Migration[6.0]
  def change
    add_reference :recipes, :user, null: true, foreign_key: true
  end
end