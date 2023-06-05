module Api # same name as folder in services
  module Liquors # same name as file in folder above
    def self.new_liquor(params, current_user)
      liquor = current_user.liquors.new(name: params[:name], brand: params[:brand], description: params[:description])

      return ServiceContract.success(liquor) if liquor.save

      ServiceContract.error(liquor.errors.full_messages)
    end

    def self.update_liquor(params)
      liquor = Liquor.find_by(id: params[:id])

      return ServiceContract.error("Liquor not found") unless liquor

      if liquor.update(name: params[:name], brand: params[:brand], description: params[:description])
        ServiceContract.success(liquor)
      else
        ServiceContract.error("Failed to update liquor")
      end
    end

    def self.delete_liquor(params)
      liquor = Liquor.find_by(id: params[:id])

      return ServiceContract.error("Liquor not found") unless liquor

      if liquor.destroy
        ServiceContract.success(liquor)
      else
        ServiceContract.error("Failed to delete liquor")
      end
    end
  end
end
