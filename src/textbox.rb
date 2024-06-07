require 'ruby2d'
require_relative 'mysprite'



class TextBox < MySprite
  attr_accessor :text, :is_active

  def initialize(image_path, x, y)
    @x = x
    @y = y
    @is_active = true
    @text = ""
    @burger_text = ""
    @burger = 0
    @text_object = Text.new(@text, x: @x + 10, y: @y + 10, size: 40, color: 'black')

    @polish_characters = {
  "a" => "ą",
  "c" => "ć",
  "e" => "ę",
  "l" => "ł",
  "n" => "ń",
  "o" => "ó",
  "s" => "ś",
  "z" => "ż",
  "x" => "ź"
}
  end

  def input(key, alt_pressed)

    burger_key = key

    if @polish_characters.has_key?(key) && alt_pressed
      key = @polish_characters[key]
    end 


    if @is_active
      if key == 'backspace'
        @text = ""
        @burger_text = ""
      
      elsif key.length == 1 &&  key.match?(/[aąbcćdeęfghijklłmnńoóprsśtuwyzźżAĄBCĆDEĘFGHIJKLŁMNŃOÓPRSŚTUWYZŹŻ]/) # DO ZROBIENIA !!!
        if @text.length < 15

          @burger_text += burger_key
          @text += key

        end
      end
      update_text
    end
  end

  def set(word)
    @text = word
    @burger_text = word
    update_text
  end



  def set_pos(x, y)
    super
    @text_object.x = @x + 10
    @text_object.y = @y + 10
  end

  def add_burger(burger)
    @burger = burger


  end

  def activate(bool)
    @is_active = bool
  end


  private

  def update_text
    @text_object.text = @text
    @burger.set_word(@burger_text)
  end



end
