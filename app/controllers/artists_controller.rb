class ArtistsController < ApplicationController
	before_action :set_artist, only: [:new_item, :show, :edit]
	before_action :authorize, except: [:new, :create]
	before_action :check_artist, only: [:show]

	def index
		@artists = Artist.all
	end

	def show
		@items = @artist.items.order(:customer_last)
	end

	def new
		@artist = Artist.new
	end

	def edit
	end

	def create
		@artist = Artist.new artist_params
		if @artist.save
			CustomerMailer.welcome_email(@artist).deliver
			session[:artist_id] = @artist.id
			redirect_to create_session_at_sign_up_path(@artist)
		else
			redirect_to new_artist_path, notice: "Something went wrong."
		end
	end
	
	def update
		@artist = Artist.find(params[:id])
		@artist.update artist_params
		if @artist.update artist_params
			redirect_to artist_path(@artist), notice: "Your account information was successfully updated."
		else
			redirect_to artist_path(@artist), notice: "Something went wrong."
		end
	end

	def destroy
		@artist = Artist.find(params[:id])
		@artist.destroy
		if @artist.destroy
			session[:artist_id] = nil
			redirect_to root_path, notice: "Your account was successfully deleted!"
		else
			redirect_to artist_path(@artist), notice: "Something went wrong."
		end
	end

	def send_customer_update_email
		#except the argument you need for this method to know which email to send, to who, in which circumstance
	end

	def send_test_email
		set_artist
		CustomerMailer.welcome_email(@artist).deliver
		redirect_to artist_path(@artist), notice: "Email Sent..."
	end


private

	def set_artist
		if params[:artist_id].present?
			@artist = Artist.find(params[:artist_id])
		else
		    @artist = Artist.find(params[:id])
		end
	end

	def artist_params
		params.require(:artist).permit(:first_name, :last_name, :company_name, :email, :password, :password_confirmation)
	end	

end