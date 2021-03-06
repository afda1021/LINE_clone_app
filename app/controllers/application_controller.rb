class ApplicationController < ActionController::Base
  include SessionsHelper

  private
  
    def logged_in_user
      if !logged_in?
        redirect_to login_url
      end
    end
end
