require 'ruby2d'

class Timer
  attr_reader :x, :y, :w, :h, :duration

  def initialize(x, y, w, h, duration)
    @x = x
    @y = y
    @w = w
    @h = h

    @duration = duration * 50
    @time = 0
    @is_active = true

    @rectangle1 = Rectangle.new(x: x, y: y, width: w, height: h, color: 'white')
    @rectangle2 = Rectangle.new(x: x, y: y, width: 0, height: h, color: 'green')
  end

  def add_time(added_time)
    @time -= added_time * 50
  end

  def update
    return unless @is_active

    @time += 1

    ratio = @time.to_f / @duration
    ratio = 1 if ratio > 1
    @rectangle2.width = @w * (1-ratio)
  end

  def is_over
    @is_active && @time >= @duration
  end

  def activate(bool)
    @is_active = bool
  end

  def remove
    @rectangle1.remove
    @rectangle2.remove
  end
end
