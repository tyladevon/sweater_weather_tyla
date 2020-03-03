class Api::V1::BackgroundController < ApplicationController 
  def show 
    background = BackgroundFacade.new(params[:location]).image
    render json: background
  end
end