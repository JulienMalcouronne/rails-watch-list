# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts "start seeding"

  url = "http://tmdb.lewagon.com/movie/top_rated"
  url_serialized = URI.open(url).read
  top = JSON.parse(url_serialized)
  all_movies = top["results"]

  all_movies.each do |movie|
    params = {
      title: movie["title"],
      overview: movie["overview"],
      rating: movie["vote_average"],
      poster_url: "https://www.themoviedb.org/t/p/w1280#{movie["poster_path"]}"
    }
  Movie.create!(params)
  end


puts "seeding end..."
