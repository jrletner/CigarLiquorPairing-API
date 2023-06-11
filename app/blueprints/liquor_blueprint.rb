class LiquorBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :brand, :description, :image_path
  association :user, blueprint: UserBlueprint
end
