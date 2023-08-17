# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
require 'open-uri'
require 'json'
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Movie.destroy_all
url = "https://tmdb.lewagon.com/movie/top_rated"

puts "Je choppe les films"
file = URI.open(url)
movies = JSON.parse(file.read)
movies['results'].each do |movie|
  Movie.create(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end
puts "jai fini de chopper"
