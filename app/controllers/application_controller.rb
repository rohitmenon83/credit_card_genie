class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  around_filter :set_time_zone

  def set_time_zone(&block)
    time_zone = current_user.try(:time_zone) || 'UTC'
    Time.use_zone(time_zone, &block)
  end

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, :email, :password, :password_confirmation, :dob, :credit_card_no1, :credit_card_no2, :credit_card_no3) }

    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, :password, :password_confirmation,:current_password, :dob, :is_female, :credit_card_no1, :credit_card_no2, :credit_card_no3) }

  end

  def after_sign_in_path_for(user)
    "/user_credit_cards"
  end


end
