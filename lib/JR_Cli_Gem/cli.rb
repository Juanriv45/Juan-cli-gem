class MoviesComingSoon::CLI

  def call
    puts "This is a list of the movies that are coming soon (IMBD Site)"
    retrieve_movies
    list_movies
    menu
  end

  def list_movies
    puts MoviesComingSoon::Movie.movie_list
  end
  def retrieve_movies
    MoviesComingSoon::Movie.today
  end
  def menu
    puts "Enter the name of the movie of which you would like to see a description for or enter list to see the list again or enter exit:"
    input = nil
    while input != "exit"
      input = gets.strip.downcase
      case input
      when "joe dirt"
        puts "That movie sucks"
      when "mib 3"
        puts "Good Choice"
      when "list"
        list_movies
      end
    end

  end

end
