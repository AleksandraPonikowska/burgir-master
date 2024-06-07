require 'ruby2d'
require_relative 'mysprite'

class Burger < MySprite

  def initialize(path, x, y)
    @x = x
    @y = y
    @word = ""
    @ingredients = []
    bottom_bun
    top_bun
  end

  def set_word(word)
    @word = word
    update
  end 

  private

  def update

    expected_length = 2 + @word.length 
    
    if  expected_length == 2
      while @ingredients.length > 1
        @ingredients.pop.remove
      end
      top_bun
    elsif @ingredients.length < expected_length
      @ingredients.pop.remove 
      add_ingredient("#{@word[-1]}.png", @word.length-1 )
      top_bun
    end

  end
  
  def bottom_bun
    add_ingredient("bula1.png", 0)
  end

  def top_bun
    add_ingredient("bula2.png", @word.length)
  end

  def add_ingredient(image_path, n)
    @ingredients << MySprite.new("burger/#{image_path}", @x, @y - n * 20)
  end

end
