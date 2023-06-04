module Api
  module V1
    class PairingsController < Api::V1::ApplicationController
      def index
        pairing = Pairing.all
        render json: pairing
      end
    end
  end
end
