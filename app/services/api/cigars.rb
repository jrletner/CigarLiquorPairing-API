module Api # same name as folder in services
  module Cigars # same name as file in folder above
    def self.new_cigar(params, current_user)
      cigar = current_user.cigars.new(name: params[:name], brand: params[:brand], description: params[:description])

      return ServiceContract.success(cigar) if cigar.save

      ServiceContract.error(cigar.errors.full_messages)
    end
  end
end
