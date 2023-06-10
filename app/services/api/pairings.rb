module Api # same name as folder in services
  module Pairings # same name as file in folder above
    def self.new_pairing(params, current_user)
      pairing = current_user.pairings.new(cigar_id: params[:cigar_id], name: params[:name], liquor_id: params[:liquor_id])

      return ServiceContract.success(pairing) if pairing.save

      ServiceContract.error(pairing.errors.full_messages)
    end

    def self.update_pairing(params)
      pairing = Pairing.find_by(id: params[:id])

      return ServiceContract.error("Pairing not found") unless pairing

      if pairing.update(name: params[:name], cigar_id: params[:cigar_id], liquor_id: params[:liquor_id])
        ServiceContract.success(pairing)
      else
        ServiceContract.error("Failed to update pairing")
      end
    end

    def self.delete_pairing(params)
      pairing = Pairing.find_by(id: params[:id])

      return ServiceContract.error("Pairing not found") unless pairing

      if pairing.destroy
        ServiceContract.success(pairing)
      else
        ServiceContract.error("Failed to delete pairing")
      end
    end
  end
end
