module SessionsHelper
    
    # Logs in the given user.
    def log_in(user)
        session[:user_id] = user.id
    end

    # Remembers a user in a persistent session.
    def remember(user)
        user.remember
        cookies.permanent.signed[:user_id] = user.id
        cookies.permanent[:remember_token] = user.remember_token
    end

    # Returns true if the given user is the current user.
    def current_user?(user)
        user == current_user
    end

    # Returns the user corresponding to the remember token cookie.
    def current_user
        if (user_id = session[:user_id])
            @current_user ||= User.find_by(id: user_id)
        elsif (user_id = cookies.signed[:user_id])
            user = User.find_by(id: user_id)
        if user && user.authenticated?(cookies[:remember_token])
            log_in user
            @current_user = user
        end
        end
    end

    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end

    # Forgets a persistent session.
    def forget(user)
        user.forget
        cookies.delete(:user_id)
        cookies.delete(:remember_token)
    end

    # Logs out the current user.
    def log_out
        forget(current_user)
        session.delete(:user_id)
        @current_user = nil
    end


    # def remember_user(user)
    #     user.user_remember
    #     # Because it places the id as plain text, this method exposes the form of the application’s cookies
    #     # and makes it easier for an attacker to compromise user accounts. To avoid this problem,
    #     # we’ll use a signed cookie, which securely encrypts the cookie before placing it on the browser:
    #     cookies.signed[:user_id] = {value: user.id, expires: 5.minutes.from_now.utc}
    #     cookies[:remember_token] = {value: user.remember_token, expires: 5.minutes.from_now.utc}
    # end


    
end