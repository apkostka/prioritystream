class HomeController < ApplicationController
	before_filter :signed_in_user, only: [:index]

  def index
  end
end
