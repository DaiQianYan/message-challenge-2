class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method def current_user
    @current_user ||= User.find_by_name("Dafeng Guo")
  end
end
