class UsersController < ApplicationController
  def show
    if current_user != User.find(params[:id])
      redirect_to root_path
    end
    @pets = (Animal.where("user_id = ?", current_user.id))
  end
end
