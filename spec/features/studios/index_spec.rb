require 'rails_helper'

RSpec.describe 'studio index page' do
  it 'lists each studio, its attributes, and its associated movies' do
    # Story 1
    # Studio Index
    #
    # As a user,
    # When I visit the studio index page
    # I see a each studio's name and location
    # And underneath each studio, I see the titles of all of its movies.
    studio1 = Studio.create!(name: 'Universal Studios', location: 'Hollywood')
    studio2 = Studio.create!(name: 'MGM', location: 'Hollywood')
    movie1 = studio1.movies.create!(title: 'Jurassic Park', creation_year: 1993, genre: 'Adventure')
    movie2 = studio1.movies.create!(title: 'Shrek', creation_year: 2001, genre: 'Comedy')
    movie3 = studio2.movies.create!(title: 'Skyfall', creation_year: 2012, genre: 'Action')

    visit '/studios'

    expect(page).to have_content(studio1.name)
    expect(page).to have_content("Location: #{studio1.location}")
    expect(page).to have_content(movie1.title)
    expect(page).to have_content(movie2.title)

    expect(page).to have_content(studio2.name)
    expect(page).to have_content("Location: #{studio2.location}")
    expect(page).to have_content(movie3.title)

  end
end
