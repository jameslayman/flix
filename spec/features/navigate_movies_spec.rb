require "rails_helper"

describe "Navigating movies" do

  it "allows navigation from detailed page to list page." do
    movie = Movie.create(title: "Superman",
                          rating: "G",
                          description: "Super fast, super crappy!",
                          released_on: "2007-08-05",
                          total_gross: 30000000.0,
                          rank: 3)

    visit movie_url(movie)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end

  it "allows navigation from list page to detailed page." do
    movie = Movie.create(title: "Superman",
                          rating: "G",
                          description: "Super fast, super crappy!",
                          released_on: "2007-08-05",
                          total_gross: 30000000.0,
                          rank: 3)

    visit movies_url

    click_link movie.title

    expect(current_path).to eq(movie_path(movie))
  end
end
