require 'ruby2d'
require_relative 'mysprite'

class Burger < MySprite
  attr_accessor :word

  def initialize(path, x, y)
    #super(path, x, y)  # Call the parent class's initialize method if necessary
    @x = x
    @y = y
    @word = ""
    @ingredients = []
    @ingredients << MySprite.new("burger/bula1.png", @x, @y)
    top_bun


  end

  def top_bun
    @ingredients << MySprite.new("burger/bula2.png", @x, @y - (word.length) * 20)
  end

  def set_word(word)
    @word = word
    update
  end 

  def update

    # Usuń wszystkie elementy, jeśli długość `@ingredients` jest inna niż oczekiwana
    expected_length = 2 + @word.length # 2 stałe obrazy + liczba liter w słowie

    if @word.length == 0 && @ingredients.length != 2
      while @ingredients.length > 1
        @ingredients.pop.remove
      end
      top_bun

    end

    if @ingredients.length < expected_length
      @ingredients.pop.remove 
      @ingredients << MySprite.new("burger/#{word[-1]}.png", @x, @y - (word.length-1) * 20)
      top_bun
    end
  

  end
  

end
