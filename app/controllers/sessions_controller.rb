class SessionsController < ApplicationController
skip_before_action :authorize
  def new
  end

  def create
    #@artist = Artist.find(params[:id])
    artist = Artist.find_by(email: params[:email])
    if artist and artist.authenticate(params[:password])
      session[:artist_id] = artist.id
      redirect_to artist_path(artist)
    else
      redirect_to sign_in_path, notice: "Invalid email/password combination."
    end
  end

  def destroy
    session[:artist_id] = nil
    redirect_to root, notice: "You successfully logged out."
  end
end
