class UsersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_error
    def show 
        user  = User.find_by(id: params[:id])
        render json: user, include: :items, status: :ok
    end



    private 
    def handle_error 
        render json: {error: "User not found"}
    end

end
