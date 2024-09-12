class AddRecipeIdToDetails < ActiveRecord::Migration[6.1]
  def change
    add_reference :details, :recipe, null: false, foreign_key: true
  end
end