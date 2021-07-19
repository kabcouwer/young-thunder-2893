require 'rails_helper'

RSpec.describe 'movies show page' do
  it 'displays the movie and its attributes, a list of all its actors from youngest to oldest, and the average age of all the movies actors' do
    # Story 2
    # Movie Show
    #
    # As a user,
    # When I visit a movie's show page.
    # I see the movie's title, creation year, and genre,
    # and a list of all its actors from youngest to oldest.
    # And I see the average age of all of the movie's actors
    studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie1 = studio.movies.create!(title: 'Jurassic Park', creation_year: 1993, genre: 'Adventure')
    actor1 = Actor.create!(name: 'Laura Dern', age: 30)
    actor2 = Actor.create!(name: 'Samuel L. Jackson', age: 35)
    actor3 = Actor.create!(name: 'Ariana Richards', age: 20)
    MovieActor.create!(movie: movie1, actor: actor1)
    MovieActor.create!(movie: movie1, actor: actor2)
    MovieActor.create!(movie: movie1, actor: actor3)

    visit "/movies/#{movie1.id}"

    expect(page).to have_content(movie1.title)
    expect(page).to have_content("Year Created: #{movie1.creation_year}")
    expect(page).to have_content("Genre: #{movie1.genre}")
    expect(actor3.name).to appear_before(actor1.name)
    expect(actor1.name).to appear_before(actor2.name)
    expect(page).to have_content("Average age of actors: 28")
  end
end
