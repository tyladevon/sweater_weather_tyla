class Api::V1::UsersController < ApplicationController
  def create
    user = User.create(user_params)
    if user.save
    render json: UserSerializer(user), status:201
    else 
      render json: {error: ""}, status: 400
    end
  end 

  private 

  def user_params
    params.require(:user).permit(:email, :password)
  end
end 