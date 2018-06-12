class LoginController < ApplicationController

  def index

  end

  def new

    @user = User.new

  end

  def create

    begin

      @user = User.new(get_user_param)

      User.transaction do
        @user.save!
      end

      flash[:notice] = get_message("notice","101","Regist User Success")

      redirect_to controller: :login, action: :index

    rescue => e
      if e.message.present?
        throw_msg = e.message
        flash[:danger] = get_message("error","101",throw_msg)
      end
      # Create an error message.
      redirect_to controller: :login, action: :index
    # ensure
      # redirect_to controller: :login, action: :index, user_id: params[:para_uid]
    end

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
    params.require(:user).permit(:user_key, :user_email, :user_name, :user_password, :password_digest, :password, :password_confirmation).merge(password: params[:user_password], password_confirmation: params[:user_password])
  end

end
