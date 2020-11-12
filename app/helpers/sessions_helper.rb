module SessionsHelper

    # Logs in a user
    def log_in(user)
        session[:user_id] = user.id
    end

    # Returns the logged in user (if anyone)
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: cookies.signed[:user_id])
            if user && user.authenticated?(:remember, cookies[:remember_token])
                log_in user
                @current_user = user
            end
        end
    end

    # Returns true if a user is logged in
    def logged_in?
        !current_user.nil?
    end

    # Logs out a user
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end

    # Remembers a user
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # Forgets a user
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end
end
