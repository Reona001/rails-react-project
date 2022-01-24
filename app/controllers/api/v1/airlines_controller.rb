module Api
  module V1
    class AirlinesController < ApplicationController
      def index
        airlines = Airline.all
        render json: AirlineSerializer.new(airlines, options).serialized_json
        # we are passing airlines to our serializer method and then converting that to serialized_json and then rendering it as json: from our controller method.
        # same with the show as well just individual airline found using params[:slug]
      end

      def show
        #find airline by its slug and the params slug passed from previous url
        airline = Airline.find_by(slug: params[:slug])
        render json: AirlineSerializer.new(airline, options).serialized_json

      def create
        airline = Airline.new(airline_params)

        if airline.save
          render json: AirlineSerializer.new(airline).serialized_json
        else
          render json: { error: airline.errors.messages }, status: 422 #422 is unprocessable entity error
        end
      end

      def update
        airline = Airline.find_by(slug: params[:slug])

        if airline.update(airline_params)
          render json: AirlineSerializer.new(airline, options).serialized_json
        else
          render json: { error: airline.errors.messages }, status: 422
        end
      end

    def destroy
      airline = Airline.find_by(slug: params[:slug])

      if airline.desroy
        head :no_content
      else
        render json: { error: airline.errors.messages }, status: 422
      end
    end

      private

      def airline_params
        #creating a whitelist of params we are going to allow
        params.require(:airline).permit(:name, :image_url)
      end

      def options
        @options ||= { indclude: %i[reviews] }
      end
    end
  end
end
