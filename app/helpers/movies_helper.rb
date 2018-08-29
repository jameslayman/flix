module MoviesHelper
  def format_total_gross(total_gross)
    if total_gross<50000000
      "#{number_to_currency(total_gross)} - It's a total FLOP!"
    else
      "#{number_to_currency(total_gross)} - It's a HIT!"
    end
  end
end
