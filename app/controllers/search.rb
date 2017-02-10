require_relative '../models/spotify'

get '/' do 
	# p GoodReads.search(author: "Neil Gaiman")
	erb :'index'

end

post '/search' do 
	# @track_names = Spotify.search(params[:query])
	@book_names = GoodReads.find_images(params[:query])
	@book_titles = GoodReads.find_title(params[:query])
	@book_authors = GoodReads.find_author(params[:query])

	if request.xhr?
		erb :'_good_reads', layout: false
	else
		erb :"results"
	end
end