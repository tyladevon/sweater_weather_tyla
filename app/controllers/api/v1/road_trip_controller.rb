class Api::V1::RoadTripController < ApplicationController 
  def create
    if User.find_by(api_key: params[:api_key])
      road_trip = RoadTripFacade.new(params[:origin], params[:destination]).roadtrip 
      render json: RoadTripSerializer.new(road_trip), status: 201
    else
      render json: {error: "bad credentials"}, status: 401 
    end
  end
end