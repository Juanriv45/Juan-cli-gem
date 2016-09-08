class MoviesComingSoon::CLI

  def call
    puts "These are the movies that are being shown today"
    list_movies
    menu
  end

  def list_movies
    puts "Joe Dirt"
    puts "MIB 3"
  end

  def menu
    puts "Enter the name of the movie of which you would like to see the movie times for or enter list to see the list again or enter exit:"
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
