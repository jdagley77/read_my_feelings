
class Spotify

	def self.search(query)
		# httparty get call goes here
		# returns a list of information ie track names
		response = HTTParty.get("https://api.spotify.com/v1/search?q=#{query}&type=track")
		response["tracks"]["items"].map {|track| track["name"]}
	end

end

# then in the controller, @tracks = Spotify.search(params[:query])

class GoodReads

	def self.search(query)
		p "https://www.goodreads.com/search.xml?key=KwEsAWkmwSnmu5o3Va95zA&q=#{query}"	
		response = HTTParty.get("https://www.goodreads.com/search.xml?key=KwEsAWkmwSnmu5o3Va95zA&q=#{query}")
		# returns a link to the image of the first best book
		# response["GoodreadsResponse"]["search"]["results"]["work"][0]["best_book"]["image_url"]
		p response.parsed_response
		# returns an array of each book (20 books)
		best_books_array = response.parsed_response["GoodreadsResponse"]["search"]["results"]["work"]
		p best_books_array
		# returns an array of image urls

		best_books_array.map {|book| book["best_book"]["image_url"]}
		
	end
end