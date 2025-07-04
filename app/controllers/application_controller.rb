class ApplicationController < ActionController::Base
    before_action :authenticate
    helper_method :logged_in?, :current_user

    def logged_in?
        !!current_user
    end

    def current_user
        return unless session[:user_id]
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def authenticate
        return if logged_in?
        redirect_to root_path, alert: 'ログインが必要です'
    end
end
