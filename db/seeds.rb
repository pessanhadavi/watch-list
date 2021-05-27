require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
base_url = "http://tmdb.lewagon.com/movie/top_rated"
base_poster_url = "https://image.tmdb.org/t/p/original"

puts "Cleaning up database..."
Movie.destroy_all

puts "Uploading 10 movies to the database..."

10.times do
  url = "#{base_url}?page=#{rand(200)}"
  movies = JSON.parse(open(url).read)['results']
  movie = movies.first
  new_movie = Movie.create!(
  title: movie['title'],
  overview: movie['overview'],
  poster_url: "#{base_poster_url}#{movie['backdrop_path']}",
  rating: movie['vote_average']
  )
  puts "#{new_movie.id} - #{new_movie.title} created"
end
  
puts "Movies uploaded!"
