class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :devise_sanitizer, if: :devise_controller?
  layout :layout_select
  protected
  def devise_sanitizer
    [:account_update, :sign_up].each do |action|
      devise_parameter_sanitizer.for(action) << [:name, :phone,:about,:address,:company,:photo]
    end

  end

  def layout_select
    if controller_name == 'sessions' || controller_name == 'registrations' && action_name == 'new'
     'public'
    else
      'admin'
    end
  end

  def is_admin?
    if current_agent.admin?
      true
    else
      redirect_to root_path, alert: 'No puedes acceder porque no eres admin'
    end
  end
end
