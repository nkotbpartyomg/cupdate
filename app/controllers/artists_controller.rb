class ArtistsController < ApplicationController
	before_action :set_artist, only: [:new_item, :show, :edit]

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
			redirect_to artist_path(@artist), notice: "Thanks for registering!"
		else
			redirect_to new_artist_path, notice: "Something went wrong."
		end
	end
	
	def update
		@artist = Artist.find(params[:id])
		@artist.update artist_params
		if @artist.update artist_params
			CustomerMailer.welcome_email(@artist).deliver
			redirect_to artist_path(@artist), notice: "Successfully updated."
		else
			redirect_to artist_path(@artist), notice: "Something went wrong."
		end
	end

	def destroy
	end

	def send_customer_update_email
		#except the argument you need for this method to know which email to send, to who, in which circumstance
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