require 'ostruct'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_current_user

  def set_current_user
  	@current_user = set_by_session
  end

  def set_by_session
  	if session[:artist_id].present?
  		Artist.find(session[:artist_id])
  	else
  		OpenStruct.new(:full_name => "Guest")
  	end
  end


  protected

    def authorize
      unless Artist.find_by(id: session[:artist_id])
        redirect_to sign_in_path, notice: "You need to be logged in to do that!"
      end
    end


	def check_artist
		unless session[:artist_id] == @artist.id
      artist = Artist.find(session[:artist_id])
			redirect_to artist_path(artist), notice: "You are not authorized to do that."
		end
	end

end
