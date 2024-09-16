class RecipeMaterial < ApplicationRecord
  attribute :material_name, :string
  belongs_to :recipe
  belongs_to :material
  
  validates :saving_size, :unit, presence: true
  
  after_find :set_material_name
  before_validation :update_material_id
  
  private
  
  def set_material_name
    material = Material.find_by(id: self.material_id)
    self.material_name = material.name
    self
  end
   
  def update_material_id
    material = Material.find_or_create_by(name: self.material_name)
    if !self.material_id.present?
      self.material_id = material.id
    elsif self.material_id != material.id
      self.material_id = material.id
    end
    self
  end
end
