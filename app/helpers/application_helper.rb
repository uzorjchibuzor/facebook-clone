module ApplicationHelper

    def logged_in_only
    
        unless user_signed_in?
          flash[:warning] = "You need to Sign in first"
        redirect_to root_url 
    
        end
       end
end
