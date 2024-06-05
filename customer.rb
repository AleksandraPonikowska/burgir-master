require_relative 'timer'

class Customer < MySprite
  attr_accessor :syllabe, :active, :movement, :timer

  def initialize(image_path, x, y)
    super(image_path, x, y)
    @syllabe = ''
    @active = false
    @talk = []
    @movement = 0
    @delay = 0
    @timer = nil
  end

  def reset(dict)
    @syllabe = dict.random_syllable
    @time = 0
  end

  def update
    if @active && @timer
      @timer.update
    end

    if @delay > 0
      @delay -= 1
    elsif @delay.zero?
      @movement = -10
      @delay = -1
    end

    @time += 1
    set_pos(@x, @y + @movement)

    if @movement > 0
      @movement -= 0.25
    elsif @movement < 0
      @movement += 0.25
    end

    if @y == 75
      if !@active
        @active = true
        @talk << MySprite.new("cat_talk.png", @x, @y)
        @talk << Text.new(@syllabe, x: @x + 25, y: @y + 30, size: 50, color: 'black')
        @timer = Timer.new(@x + 25, @y + 300, 100, 15, 10)
      end
    else
      if @active
        @active = false
        @talk.each(&:remove)
        @talk.clear
        @timer.remove if @timer
        #@timer = nil
      end
    end
  end

  def enter_in(delay)
    @delay = delay * 50
  end

  def leave(dict)
    @movement = 10
    @timer.remove if @timer
    reset(dict)
  end

  def is_valid(word)
    word.include?(@syllabe)
  end

  def remove
    @timer.remove if @timer
    @talk.each(&:remove)
    @object.remove
  end
end
