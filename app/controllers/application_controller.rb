class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  include Authenticable
  protect_from_forgery with: :null_session
  serialization_scope :view_context



end
