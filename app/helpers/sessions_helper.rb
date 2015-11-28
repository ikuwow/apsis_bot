module SessionsHelper
    def log_in (user)
        # save encrypted user id in cookie
        session[:user_id] = user.id
    end
end
