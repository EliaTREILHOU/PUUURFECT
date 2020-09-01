class UsersController < ApplicationController

  def show 
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(params.require(:user).permit(
      :first_name, :last_name, :description, :adress, :zipcode)
    )
    redirect_to_user_path(@user)
  end

end
