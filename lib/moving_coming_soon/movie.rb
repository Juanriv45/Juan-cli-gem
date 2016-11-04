class MoviesComingSoon::Movie

  @@movie_list = []

  def self.scrape_IMDB

    doc = Nokogiri::HTML(open("http://www.imdb.com/movies-coming-soon/"))

    doc.search(".list-item").each do |movie|
      #puts movie
      #@@movie_list <<
      self.new({
        title: movie.css('h4 a').content.gsub(/[(]\w+[)]/, "").strip
        description: movie.css('div.outline').content.strip
      }
    end


  end

#  def self.chosen_movie_description(movie)
#    if @@movie_list.include?(movie) then
#      @@description_list[@@movie_list.index(movie)]
#    else
#      puts "Sorry, please try again"
#    end
#  end

  def self.movie_included?(input)
    lower_case_list = @@movie_list.collect do |movie|
      movie.downcase
    end
    lower_case_list.include?(input)
  end

  def self.movie_description(input)
    @@movie_list.each_with_index do |movie,index|
      if movie.downcase == input then
        puts @@description_list[index]
      end
    end
  end

  def self.movie_list
    @@movie_list
  end


end
