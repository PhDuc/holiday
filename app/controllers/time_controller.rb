class TimeController < ApplicationController
  def countdown
    @events = (0..100).to_a
  end

  private
  def is_login?
    true #session[:user_login]
  end
end
