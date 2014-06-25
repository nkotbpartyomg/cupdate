class ItemsController < ApplicationController
	before_action :set_artist

	def index
		redirect_to [@artist]
	end

	def show
		@item = @artist.items.find(params[:id])
		if @item.blank?
			redirect_to [@artist], notice: "That item doesn't exist"
		else
			render "show"
		end
	end

	def new
		 @item = @artist.items.new
	end

	def edit
		@item = @artist.items.find(params[:id])
	end

	def create
		@item = @artist.items.new item_params
		if @item.save 
			redirect_to [@artist, @item], notice: "Item was successfully created!"
		else
			render "new", notice: "Something went wrong."
		end
	end

	def update
		@item = Item.find(params[:id])
		@item.update item_params
		if @item.update item_params
			CustomerMailer.update_email(@artist, @item).deliver
			redirect_to [@artist, @item], notice: "#{@item.name} was successfully updated!"
			#don't redirect
		else
			render "show", notice: "Something went wrong."
		end
	end

	def destroy
		@item = Item.find(params[:id])
		@item.destroy
		if @item.destroy
			redirect_to [@artist], notice: "#{@item.name} was successfully deleted!"
		else
			render "show", notice: "Something went wrong."
		end
	end



private

	def item_params
		params.require(:item).permit(:name, :description, :artist_id, :status, :note, :customer_email, :customer_first, :customer_last)
	end

	def set_artist
		@artist = Artist.find(params[:artist_id])
	end

end