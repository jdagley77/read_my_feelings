class GoodReads

	def self.find_images(query)
		query.gsub(/\s+/, "%20")
		p "https://www.goodreads.com/search.xml?key=KwEsAWkmwSnmu5o3Va95zA&q=#{query}"	
		response = HTTParty.get("https://www.goodreads.com/search.xml?key=KwEsAWkmwSnmu5o3Va95zA&q=#{query}")
		# returns a link to the image of the first best book
		p response.parsed_response
		# returns an array of each book (20 books)
		best_books_array = response.parsed_response["GoodreadsResponse"]["search"]["results"]["work"]
		p best_books_array
		# returns an array of image urls
		best_books_array.map {|book| book["best_book"]["image_url"]}

	end

	def self.find_author(query)
		query.gsub(/\s+/, "%20")
		response = HTTParty.get("https://www.goodreads.com/search.xml?key=KwEsAWkmwSnmu5o3Va95zA&q=#{query}")
		best_books_array = response["GoodreadsResponse"]["search"]["results"]["work"]
		best_books_array.map {|book| book["best_book"]["author"]["name"]}

	end

	def self.find_title(query)
		query.gsub(/\s+/, "%20")
		response = HTTParty.get("https://www.goodreads.com/search.xml?key=KwEsAWkmwSnmu5o3Va95zA&q=#{query}")
		best_books_array = response["GoodreadsResponse"]["search"]["results"]["work"]
		best_books_array.map {|book| book["best_book"]["title"]}

	end

end