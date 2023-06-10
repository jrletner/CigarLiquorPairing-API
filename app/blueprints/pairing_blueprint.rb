class PairingBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :cigar_id, :user_id, :liquor_id
  association :user, blueprint: UserBlueprint
  association :cigar, blueprint: CigarBlueprint
  association :liquor, blueprint: LiquorBlueprint
end
