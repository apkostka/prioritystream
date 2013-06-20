class HomeController < ApplicationController
  def index
  	@readme = File.read("/Library/WebServer/Documents/prioritystream/README.rdoc")
  end
end
