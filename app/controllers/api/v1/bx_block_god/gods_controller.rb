module Api
  module V1
    module BxBlockGod
      class GodsController < ApplicationController
        skip_before_action :verify_authenticity_token
        
        def index
          @gods = ::BxBlockGod::God.all
          render json: {
            gods: @gods.as_json(only: [
              :id, :name, :sanskrit_name, :description, :significance, 
              :festivals, :temples, :mantras, :image_url, :role, 
              :category, :consort_of, :avatar_of
            ])
          }, status: :ok
        end
        
        def show
          @god = ::BxBlockGod::God.find(params[:id])
          render json: {
            god: @god.as_json(only: [
              :id, :name, :sanskrit_name, :description, :significance, 
              :festivals, :temples, :mantras, :image_url, :role, 
              :category, :consort_of, :avatar_of
            ]).merge(
              bhajans: @god.bhajans.as_json(only: [:id, :bhajan_type, :text])
            )
          }, status: :ok
        rescue ActiveRecord::RecordNotFound
          render json: { error: "God not found" }, status: :not_found
        end
        
        def create
          @god = ::BxBlockGod::God.new(god_params)
          
          if @god.save
            render json: {
              message: "God created successfully",
              god: @god.as_json(only: [:id, :name, :sanskrit_name, :description])
            }, status: :created
          else
            render json: { errors: @god.errors.full_messages }, status: :unprocessable_entity
          end
        end
        
        def update
          @god = ::BxBlockGod::God.find(params[:id])
          
          if @god.update(god_params)
            render json: {
              message: "God updated successfully",
              god: @god.as_json(only: [:id, :name, :sanskrit_name, :description])
            }, status: :ok
          else
            render json: { errors: @god.errors.full_messages }, status: :unprocessable_entity
          end
        rescue ActiveRecord::RecordNotFound
          render json: { error: "God not found" }, status: :not_found
        end
        
        def destroy
          @god = ::BxBlockGod::God.find(params[:id])
          @god.destroy
          
          render json: { message: "God deleted successfully" }, status: :ok
        rescue ActiveRecord::RecordNotFound
          render json: { error: "God not found" }, status: :not_found
        end
        
        private
        
        def god_params
          params.require(:god).permit(
            :name, :sanskrit_name, :description, :significance, 
            :festivals, :temples, :mantras, :image_url, :image,
            :role, :category, :consort_of, :avatar_of
          )
        end
      end
    end
  end
end 