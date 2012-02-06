class HomeController < ApplicationController
  def index
    @experiences = Experience.all
  end

end
