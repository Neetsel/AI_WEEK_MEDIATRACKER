# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts "Cleaning database ..."
Movie.destroy_all

puts "Creating movies"

Movie.create!(title: "Guardians of the Galaxy Vol. 2", description: "The Guardians struggle to keep together as a team while dealing with their personal family issues, notably Star-Lord's encounter with his father, the ambitious celestial being Ego.
", release_date: "05 May 2017", language: "English", duration: 136, genres: ["Action", "Adventure", "Comedy"], directors: ["James Gunn"], tags: ["Comedy", "furies"] , writers: ["James Gunn", "Dan Abnett", "Andy Lanning"], producers: ["Kevin Feige"], cast: ["Chris Pratt", "Zoe Saldaña", "Dave Bautista"], composers: ["John Williams"], studios: ["Marvel Studios"], poster: "")

puts "Finished ! Created #{Movie.count} movies"
