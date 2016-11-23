class MoviesComingSoon::Movie
  attr_reader :title, :description
  @@movie_list = []

  def initialize(title, description)
    @title = title
    @description = description
  end

  def self.scrape_IMDB
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    doc.css(".overview-top").collect do |movie|

      title = movie.css('h4 a').text.gsub(/[(]\w+[)]/, "").strip
      description = movie.css('div.outline').text.strip

      @@movie_list << self.new(title, description)

    end
  end

  def self.list_of_movies
    @@movie_list.select do |movie|
        puts movie.title
    end
  end

  def self.movie_included?(input)
    @@movie_list.any? do |movie|
      movie.title.downcase == input
    end
  end

  def self.movie_description(input)
    @@movie_list.select do |movie|
      if movie.title.downcase == input then
        puts movie.description
      end
    end
  end

end
