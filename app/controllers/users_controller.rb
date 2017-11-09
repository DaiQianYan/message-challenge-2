class UsersController < ApplicationController
  
  def show 
      @user = User.find(params[:id])
      # debugger
  end 

  def new
      @user = User.new
  end

  def create
      @user = User.new(user_params)
      if @user.save
        # Handle a successful save.
        log_in @user
        flash[:success] = "Welcome to the Sample App!"
        redirect_to @user
      else
        render 'new'
      end
  end
  
  def edit
      @user = User.find(params[:id])
  end

  
  private
  
      def user_params
        params.require(:user).permit(:name, :email, :password,
                                     :password_confirmation)
      end

  # def correct_user
  #     unless current_user == @user or current_user.role == 5
  #       redirect_to user_path(current_user), flash: {:danger => '您没有权限浏览他人信息'}
  #     end
  # end

  # def set_user
  #     @user=User.find_by_id(params[:id])
  #     if @user.nil?
  #       redirect_to root_path, flash: {:danger => '没有找到此用户'}
  #     end
  # end


end
