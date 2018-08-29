require "rails_helper"

describe "Viewing list of movies" do

  it "shows the movie" do
    movie1 = Movie.create(title: "Superman",
                          rating: "G",
                          description: "Super fast, super crappy!",
                          released_on: "2007-08-05",
                          total_gross: 30000000.0,
                          rank: 3)

    movie2 = Movie.create(title: "Iron-Man",
                          rating: "PG",
                          description: "Tony Stark would be nothing without his money!",
                          released_on: "2012-05-25",
                          total_gross: 100000.0,
                          rank: 6)

    movie3 = Movie.create(title: "The Hulk",
                          rating: "R",
                          description: "Smash, Smash, Smash! WHAT A HIT!",
                          released_on: "2018-06-02",
                          total_gross: 1568790000000.0,
                          rank: 9)

    visit movies_url

    expect(page).to have_text("3 Movies")
    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text(movie1.description)
    expect(page).to have_text(movie1.released_on)
    #expect(page).to have_decimal(movie1.total_gross)
    #expect(page).to have_int(movie1.rank)
  end

  it "does not show a movie that hasn't yet been released" do
  movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

  visit movies_path

  expect(page).not_to have_text(movie.title)
  end

end
