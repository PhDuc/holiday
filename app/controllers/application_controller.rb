class ApplicationController < ActionController::Base
  protect_from_forgery

  def clean_session
  end
end
