class AlamoTimes::Movie
  attr_accessor :name, :times
  def self.today
    movie_1 = self.new
    movie_1.name = "Joe Dirt"
    movie_1.times = ["3:00 PM","4:00 PM", "5:00 PM"]

    puts "#{movie_1.name}"

  end


end
