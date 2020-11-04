module SessionsHelper

    # Logs in a user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the logged in user (if anyone)
    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    # Returns true if a user is logged in
    def logged_in?
        !current_user.nil?
    end
end
