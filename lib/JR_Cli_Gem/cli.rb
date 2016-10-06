

class MoviesComingSoon::CLI

  def call
    puts "This is a list of the movies that are coming soon (IMDB Site)"
    retrieve_movies
    list_movies
    menu
  end

  def retrieve_movies
    MoviesComingSoon::Movie.today
  end

  def list_movies
    puts MoviesComingSoon::Movie.movie_list
  end

  def menu

    puts "Enter the name of the movie of which you would like to see a description for or enter list to see the list again or enter exit:"
    input = gets.strip.downcase

    if MoviesComingSoon::Movie.movie_included?(input) then
      puts "-----------------------------------------------"
      puts "Movie Description:"
      MoviesComingSoon::Movie.movie_description(input)
      puts "-----------------------------------------------"
      menu
    elsif input == "list"
      list_movies
      menu
    elsif input == "exit"
      puts "Thank you, please try again later!"
    else
      puts "Sorry, plese try again"
      menu
    end
  end


end
