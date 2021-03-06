class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    callback
  end

  def twitter
    callback
  end

  def callback
    omniauth = env["omniauth.auth"]
    if current_user
      current_user.authorizations.where(provider: omniauth['provider'], uid: omniauth['uid']).first_or_create
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
      redirect_to :back
    else
      authorization = Authorization.where(provider: omniauth['provider'], uid: omniauth['uid']).first
      if authorization
        flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => omniauth['provider']
        sign_in_and_redirect(authorization.user, :event => :authentication)
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end
end
