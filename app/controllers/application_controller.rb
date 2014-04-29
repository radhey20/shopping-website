class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user
  helper_method :current_cart
 
  MAX_SESSION_TIME = 15      #session expiry time

  before_filter :prepare_session


#automatic logout after 15 min
def prepare_session
    
   if current_user
   if !session[:expiry_time].nil? and session[:expiry_time] < Time.now
      # Session has expired. Clear the current session.
      session[:user_id] = nil
      redirect_to root_url        
      flash[:notice] = "Your session has expired. Please Log in to continue."
   end

   # Assign a new expiry time, whether the session has expired or not.
   session[:expiry_time] = MAX_SESSION_TIME.minutes.from_now
   return true
end
end
 private

 def current_user
  @current_user ||= User.find(session[:user_id]) if session[:user_id]
 end

 def current_cart
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
 end
end
