# Controller.

class GamesController < ApplicationController
  def new
    @letters = (0...10).map { ('a'..'z').to_a[rand(26)] } # to_a.sample
  end

  def check1
    @letters = params[:random_grid].chars
    @word = params[:word]
    @word_array = @word.chars
    @diff = @word_array - @letters
    @diff.length.positive?
  end

  def check2
    @word = params[:word]
    @url = "https://wagon-dictionary.herokuapp.com/#{@word}"
    # raise
    @html_input = open(@url).read
    @output = JSON.parse(@html_input)
    @output['found'] == false ? false : true
  end

  def score
    @answer =
      if check1
        'Sorry! Those letters are not on the list.'
      elsif check2 == false
        'Sorry! This is not a valid English word.'
      else
        'Congrats!'
      end
  end
end
