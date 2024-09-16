class CreateRecipeMaterials < ActiveRecord::Migration[6.1]
  def change
    create_table :recipe_materials do |t|
      t.references :recipe, null: false, foreign_key: true
      t.references :material, null: false, foreign_key: true
      t.float :saving_size
      t.integer :unit

      t.index [:recipe_id, :material_id], unique: true
      t.timestamps
    end
  end
end
