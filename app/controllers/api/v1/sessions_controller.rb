class Api::V1::SessionsController < ApplicationController 
  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: 201
    else
      render json: {error: "bad credentials"}, status: 400
    end
  end
end 