class LoginController < ApplicationController


  def show

    @user = User.find(params[:id])

  end

  def edit



  end

  def update

    begin
      @user = User.find_by(user_key: param[:user_key])

      User.transaction do
        v.update_attributes!(user_email: "touree@me.com")
      end

    rescue => e
      if e.message.present?
        throw_msg = e.message
        flash[:danger] = get_message("error","101",throw_msg)
      end
      # Create an error message.

      redirect_to controller: :login, action: :index
    ensure
      redirect_to controller: :login, action: :edit, user_id: params[:user_key]
    end

  end

  private
  def get_user_param
    #params.require(:user).permit(:user_key, :user_name, :user_password)
    #params.require(:user).permit(:user_key, :user_name, :user_password).merge(updated_id: session[:user_name])
    #params.require(:user).permit(:user_key, :user_email, :user_name, :user_password, :password_digest).merge(password: param[:user_password], password_confirmation: param[:user_password])
  end

end
