require 'rest-client'
require 'json'
require 'pry'

def character_hash_result
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
end

def get_character_movies_from_api(character)
  #make the web request

  characters = character_hash_result["results"]
  found_character = characters.find { |char| char["name"] == character }
  films = found_character["films"]


all_films_json = films.map { |film_url| RestClient.get(film_url) }
films_parsed = all_films_json.map { |film| JSON.parse(film) }

film_titles = films_parsed.map { |film| film["title"]}

film_titles

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.
end

def parse_character_movies(films_hash)
  films_hash.each { |film| puts "- #{film}" }
end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
