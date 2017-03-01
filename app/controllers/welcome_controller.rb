class WelcomeController < ApplicationController
  def index
    flash[:warning] = "a is #{params[:a]}, b is #{params[:b]}, c is #{params[:c]}, "
  end
end
