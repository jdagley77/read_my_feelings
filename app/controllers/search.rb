require_relative '../models/spotify'

get '/' do 
	# p GoodReads.search(author: "Neil Gaiman")
	erb :'index'

end

post '/search' do 
	# @track_names = Spotify.search(params[:query])
	@book_names = GoodReads.search(params[:query])

	if request.xhr?
		erb :'_good_reads', layout: false
	else
		erb :"results"
	end
end