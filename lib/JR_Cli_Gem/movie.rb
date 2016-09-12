class MoviesComingSoon::Movie

  @@movie_list = []
  @@description_list = []

  def self.today
    self.scrape_IMBD
  end

  def self.scrape_IMBD

    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))

    movie_count = 0
    movies = doc.css(".overview-top h4 a").each do |movie|
      @@movie_list[movie_count] = movie.content.gsub(/[(]\w+[)]/, "")
      movie_count+= 1
    end

    description_count = 0
    descriptions = doc.search(".overview-top .outline").each do |descriptions|
      @@description_list[description_count] = descriptions.content.strip
      description_count+= 1
    end

  end

  def self.chosen_movie_description(movie)
    if @@movie_list.include?(movie) then
      @@description_list[@@movie_list.index(movie)]
    else
      puts "Sorry, please try again"
    end
  end

  def self.movie_list
    @@movie_list
  end

  def self.description_list
    @@description_list
  end

end
