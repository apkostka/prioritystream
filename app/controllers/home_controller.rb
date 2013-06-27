class HomeController < ApplicationController
  def index
  	@readme = File.read("/README.rdoc")
  end
end
