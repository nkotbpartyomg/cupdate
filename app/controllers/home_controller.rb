class HomeController < ApplicationController

	def index
		if session[:artist_id].present?
			@artist = Artist.find(session[:artist_id])
		end
	end


end