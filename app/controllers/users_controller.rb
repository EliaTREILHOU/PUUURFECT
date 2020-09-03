class UsersController < ApplicationController

  def show 
    @user = current_user
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(params.require(:user).permit(
      :first_name, :last_name, :description, :address, :zipcode)
    )
    redirect_to user_path(@user)
  end


  def is_owner?
    if current_user.id.to_i != params[:id].to_i
      flash[:danger] = "Vous ne pouvez pas acceder à cette page"
      redirect_to root_path
    end
  end

end
