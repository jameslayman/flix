require "rails_helper"

describe "Viewing an individual movie" do

  it "shows the movie's details" do
    movie = Movie.create(title: "Superman",
                          rating: "G",
                          description: "Super fast, super crappy!",
                          released_on: "2007-08-05",
                          total_gross: 30000000.0,
                          rank: 3)

    visit movie_url(movie)

    expect(page).to have_text(movie.title)

    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)

    expect(page).to have_text("3/10")
  end

end
