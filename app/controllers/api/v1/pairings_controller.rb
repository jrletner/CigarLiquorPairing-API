module Api
  module V1
    class PairingsController < Api::V1::ApplicationController
      def index
        pairings = Pairing.all
        payload = {
          pairing: PairingBlueprint.render_as_hash(pairings),
        }
        render_success(payload: payload, status: 200)
      end

      def create
        result = Api::Pairings.new_pairing(params, @current_user)
        render_error(errors: "There was a problem adding the pairing", status: 400) and return unless result.success?
        payload = {
          pairing: PairingBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end

      def show
        pairing = Pairing.find(params[:id])
        payload = {
          pairing: PairingBlueprint.render_as_hash(pairing),
        }
        render_success(payload: payload, status: 200)
      end

      def update
        ppairing = Pairing.find(params[:id])
        result = Api::Pairings.update_pairing(params)
        render_error(errors: "There was an error updating the pairing", status: 400) and return unless result.success?
        previous_values = {
          id: ppairing[:id],
          user: ppairing[:user_id],
          liquor: ppairing[:liquor_id],
          cigar: ppairing[:cigar_id],
        }
        payload = {
          pairing: PairingBlueprint.render_as_hash(result.payload),
          previous_values: previous_values,
          status: 201,
        }
        render_success(payload: payload)
      end

      def delete
        result = Api::Pairings.delete_pairing(params)
        render_error(errors: "There was an error deleting the pairing", status: 400) and return unless result.success?
        payload = {
          status: "success",
          message: "The pairing was successfully deleted",
          pairing: PairingBlueprint.render_as_hash(result.payload),
          status: 201,
        }
        render_success(payload: payload)
      end
    end
  end
end
