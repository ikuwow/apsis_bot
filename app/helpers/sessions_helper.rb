module SessionsHelper
    def log_in (user)
        # save encrypted user id in cookie
        session[:user_id] = user.id
    end

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !current_user.nil?
        # last values are returned
    end
end
