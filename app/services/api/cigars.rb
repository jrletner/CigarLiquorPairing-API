module Api # same name as folder in services
  module Cigars # same name as file in folder above
    def self.new_cigar(params, current_user)
      cigar = current_user.cigars.new(name: params[:name], brand: params[:brand], description: params[:description], image_path: params[:image_path])

      return ServiceContract.success(cigar) if cigar.save

      ServiceContract.error(cigar.errors.full_messages)
    end

    def self.update_cigar(params)
      cigar = Cigar.find_by(id: params[:id])

      return ServiceContract.error("Cigar not found") unless cigar

      if cigar.update(name: params[:name], brand: params[:brand], description: params[:description], image_path: params[:image_path])
        ServiceContract.success(cigar)
      else
        ServiceContract.error("Failed to update cigar")
      end
    end

    def self.delete_cigar(params)
      cigar = Cigar.find_by(id: params[:id])

      return ServiceContract.error("Cigar not found") unless cigar

      if cigar.destroy
        ServiceContract.success(cigar)
      else
        ServiceContract.error("Failed to delete cigar")
      end
    end
  end
end
