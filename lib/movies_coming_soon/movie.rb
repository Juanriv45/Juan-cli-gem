class MoviesComingSoon::Movie

  @@movie_list = []

  def self.scrape_IMDB
    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))
    doc.css(".overview-top").collect do |movie|
      @@movie_list << {
        :title => movie.css('h4 a').text.gsub(/[(]\w+[)]/, "").strip,
        :description => movie.css('div.outline').text.strip
      }
    end

  end

  def self.movie_included?(input)
    lower_case_list = []
    @@movie_list.select do |movie|
      lower_case_list << movie[:title].downcase
    end
    lower_case_list.include?(input)
  end

  def self.movie_description(input)
    @@movie_list.select do |movie|
      if movie[:title].downcase == input then
        puts movie[:description]
      end
    end
  end

  def self.list_of_movies
    @@movie_list.select do |movie|
        puts movie[:title]
    end
  end

end
