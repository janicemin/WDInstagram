class EntriesController < ApplicationController

	def index
		@entries = Entry.all
	end

	def show
		@entry = Entry.find(params[:id])
	end

	def new
		@entry = Entry.new
	end

	def create
		@entry = Entry.new(artist_params)

				if @entry.save
					redirect_to @entry
				else 
					render :new
				end
	end

	def edit
		@entry = Entry.find(params[:id])
	end

	def update

		@entry = Entry.find(params[:id])
		@entry.update(entry_params)
		redirect_to @entry
	end

	def destroy
		@entry.destroy
		redirect_to entries_path
	end
		



private
	def entry_params
		params.require(:entry).permit(:author, :photo_url)
end

	def find_entry
		@entry = Entry.find(params[:id])
	end

end