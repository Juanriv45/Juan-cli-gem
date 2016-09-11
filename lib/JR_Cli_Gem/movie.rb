class MoviesComingSoon::Movie
  attr_accessor :name, :description, :new
  @@movie_list = []

  def self.today
    self.scrape_IMBD

  end

  def self.scrape_IMBD
    count = 0

    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))


    movies = doc.css(".overview-top h4 a").each do |movie|
      @@movie_list[count] = movie.text
      count+= 1
    end

  end

  def self.movie_list
    @@movie_list
  end

end
