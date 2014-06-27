class SessionsController < ApplicationController

  def new
  end

  def create
    artist = Artist.find_by(email: params[:email])
    if artist and artist.authenticate(params[:password])
      session[:artist_id] = artist.id
     # @session_artist_name = "#{artist.first_name} #{artist.last_name}"
      redirect_to artist_path(artist), notice: "You successfully logged in."
    else
      redirect_to sign_in_path, notice: "Invalid email/password combination."
    end
  end

  def create_at_sign_up
    artist = Artist.find(params[:artist_id])
    session[:artist_id] = artist.id
    redirect_to artist_path(artist), notice: "Thanks for registering!"
  end

  def destroy
    session[:artist_id] = nil
    redirect_to root_path, notice: "You successfully logged out."
  end
end
