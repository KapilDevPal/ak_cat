module Api
  module V1
    module BxBlockGod
      class BhajansController < ApplicationController
        skip_before_action :verify_authenticity_token

        def index
          bhajans = ::BxBlockGod::Bhajan.includes(:god).all
          render json: {
            bhajans: bhajans.map do |bhajan|
              {
                id: bhajan.id,
                title: bhajan.title,
                bhajan_type: bhajan.bhajan_type,
                text: bhajan.text,
                god_id: bhajan.god_id,
                god_name: bhajan.god&.name,
                god_sanskrit_name: bhajan.god&.sanskrit_name
              }
            end
          }, status: :ok
        end
      end
    end
  end
end 