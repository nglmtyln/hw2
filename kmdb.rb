# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:


# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)


# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)


# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.

Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# TODO!
# Generate models and tables, according to the domain model.
# Done, all within the terminal

# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

only_studio = Studio.new
only_studio["name"] = "Warner Bros."
only_studio.save

warner_bros = Studio.find_by({"name" => "Warner Bros."})

new_movie = Movie.new
new_movie["title"] = "Batman Begins"
new_movie["year_released"] = 2005
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save
batman_begins = Movie.find_by({"title" => "Batman Begins"})

new_movie = Movie.new
new_movie["title"] = "The Dark Knight"
new_movie["year_released"] = 2008
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save
dark_knight = Movie.find_by({"title" => "The Dark Knight"})

new_movie = Movie.new
new_movie["title"] = "The Dark Knight Rises"
new_movie["year_released"] = 2012
new_movie["rated"] = "PG-13"
new_movie["studio_id"] = warner_bros["id"]
new_movie.save
dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})

new_actor = Actor.new
new_actor["name"] = "Christian Bale"
new_actor.save
christian_bale = Actor.find_by({"name" => "Christian Bale"})

new_actor = Actor.new
new_actor["name"] = "Michael Caine"
new_actor.save
michael_caine = Actor.find_by({"name" => "Michael Caine"})

new_actor = Actor.new
new_actor["name"] = "Liam Neeson"
new_actor.save
liam_neeson = Actor.find_by({"name" => "Liam Neeson"})

new_actor = Actor.new
new_actor["name"] = "Katie Holmes"
new_actor.save
katie_holmes = Actor.find_by({"name" => "Katie Holmes"})

new_actor = Actor.new
new_actor["name"] = "Gary Oldman"
new_actor.save
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})

new_actor = Actor.new
new_actor["name"] = "Heath Ledger"
new_actor.save
heath_ledger = Actor.find_by({"name" => "Heath Ledger"})

new_actor = Actor.new
new_actor["name"] = "Aaron Eckhart"
new_actor.save
aaron_eckhart = Actor.find_by({"name" => "Aaron Eckhart"})

new_actor = Actor.new
new_actor["name"] = "Maggie Gyllenhaal"
new_actor.save
maggie_gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})

new_actor = Actor.new
new_actor["name"] = "Tom Hardy"
new_actor.save
tom_hardy = Actor.find_by({"name" => "Tom Hardy"})

new_actor = Actor.new
new_actor["name"] = "Joseph Gordon-Levitt"
new_actor.save
joseph_GL = Actor.find_by({"name" => "Joseph Gordon-Levitt"})

new_actor = Actor.new
new_actor["name"] = "Anne Hathaway"
new_actor.save
anne_hathaway = Actor.find_by({"name" => "Anne Hathaway"})

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = christian_bale["id"]
new_role["character_name"]= "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = michael_caine["id"]
new_role["character_name"]= "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = liam_neeson["id"]
new_role["character_name"]= "Ra's Al Ghul"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = katie_holmes["id"]
new_role["character_name"]= "Rachel Dawes"
new_role.save

new_role = Role.new
new_role["movie_id"] = batman_begins["id"]
new_role["actor_id"] = gary_oldman["id"]
new_role["character_name"]= "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = christian_bale["id"]
new_role["character_name"]= "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = heath_ledger["id"]
new_role["character_name"]= "Joker"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = aaron_eckhart["id"]
new_role["character_name"]= "Harvey Dent"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = michael_caine["id"]
new_role["character_name"]= "Alfred"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight["id"]
new_role["actor_id"] = maggie_gyllenhaal["id"]
new_role["character_name"]= "Rachel Dawes"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = christian_bale["id"]
new_role["character_name"]= "Bruce Wayne"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = gary_oldman["id"]
new_role["character_name"]= "Commissioner Gordon"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = tom_hardy["id"]
new_role["character_name"]= "Bane"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = joseph_GL["id"]
new_role["character_name"]= "John Blake"
new_role.save

new_role = Role.new
new_role["movie_id"] = dark_knight_rises["id"]
new_role["actor_id"] = anne_hathaway["id"]
new_role["character_name"]= "Selina Kyle"
new_role.save


# TODO!


# Prints a header for the movies output
puts "Movies"
puts "======"

# all_movies is an array of hashes, the capital M Movie is a table we're calling
all_movies = Movie.all

# for singular in plural
for movie in all_movies

    # we need to convert studio id # to text
    # even thought we're doing a loop for movies, we can still reference other tables, we do movie["studio_id"] because we do not know the # for each
    studio = Studio.find_by({"id" => movie["studio_id"]})
    studio_name = studio["name"]
    puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio_name}"
   
end

# Query the movies data and loop through the results to display the movies output.
# TODO!

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"

all_roles = Role.all

for role in all_roles
    movie = Movie.find_by({"id" => role["movie_id"]})
    movie_name = movie["title"]

    actor = Actor.find_by({"id" => role["actor_id"]})
    actor_name = actor["name"]


    puts "#{movie_name.inspect} #{actor_name.inspect} #{role["character_name"]}"
    
end


# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
