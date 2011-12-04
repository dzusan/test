module SessionsHelper
  def signed_in?
    !current_user.nil?
  end
  def sign_out
    cookies.delete(:remember_token)
    session[:user_id] = nil
    #self.current_user = nil
  end
  def current_user=(user)
    @current_user = user
  end

    private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end


end
