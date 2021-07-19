require 'rails_helper'

RSpec.describe 'actors creation page' do
  it 'has a form, after filling in and submitting form with actors name (actor exists in database), I am redirected back to the movies show page where the actors name is now listed' do
    # Story 3
    # Add an Actor to a Movie
    #
    # As a user,
    # When I visit a movie show page,
    # I do not see any actors listed that are not part of the movie
    # And I see a form to add an actor to this movie
    # When I fill in the form with the name of an actor that exists in the database
    # And I click submit
    # Then I am redirected back to that movie's show page
    # And I see the actor's name is now listed
    # (You do not have to test for a sad path, for example if the name submitted is not an existing actor)
    Studio.destroy_all
    Movie.destroy_all
    Actor.destroy_all
    studio = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    movie1 = studio.movies.create!(title: 'Jurassic Park', creation_year: 1993, genre: 'Adventure')
    actor1 = Actor.create!(name: 'Laura Dern', age: 30)

    visit "/movies/#{movie1.id}"

    click_link("Add Actor")
    save_and_open_page

    expect(current_path).to eq("/movies/#{movie1.id}/actors/new")

    fill_in('name', with: 'Laura Dern')

    click_button('Submit')

    # expect(current_path).to eq("/movies/#{movie1.id})
  end
end
