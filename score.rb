require_relative 'mysprite'

class Score < MySprite
  attr_reader :value

  def initialize(image_path, x, y)
    @value = 0
    @text = Text.new("0", x: x + 20, y: y + 20, size: 50,color: 'black')
  end

  def add(number)
    @value += number
    @text.text = @value.to_s
  end

  def show_score
    @object = MySprite.new("score.png",0,0)
    @text.remove
    @text = Text.new("twój wynik: "+ @value.to_s, x: 200, y: 260, size: 50,color: 'black')
    @showing_score = true
  end

end
