class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :first_name, :last_name, :name, :email

  view :login do
    association :token, blueprint: TokenBlueprint do |user, _options|
      user.tokens.last
    end
  end
end
