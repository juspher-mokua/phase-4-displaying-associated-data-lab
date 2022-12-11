class ItemsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :handle_error
    def index 
        item  = Item.all
        render json: item, include: :user, status: :ok
    end



    private 
    def handle_error 
        render json: {error: "Item not found"}
    end
end
