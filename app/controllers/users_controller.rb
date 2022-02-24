class UsersController < ApplicationController
    def show
        user = find_user
        render json: user, include: :items
    rescue ActiveRecord::RecordNotFound => invalid
        render json: invalid.record.errors
    end

    private

    def find_user
        user = User.find params[:id]
    end
end
