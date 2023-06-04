module Api
  module V1
    class CigarsController < Api::V1::ApplicationController
      def index
        cigar = Cigar.all
        render json: cigar
      end
    end
  end
end
