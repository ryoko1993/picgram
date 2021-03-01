class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:passwprd])
      log_in user 
      redirect_to root_path, success: `ログイン実行しました`
    else
      flash.now[:danger] = `ログイン失敗しました`
      render :new
    end
  end
  
  def destroy
    log_out
    redict_to root_url, info: `ログアウトしました`
  end
  
  private
  def log_in(user)
    session[:user_id] = user.id
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end