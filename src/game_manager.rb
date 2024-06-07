# game_manager.rb

class GameManager
  attr_accessor :score, :textbox, :timer, :customers, :dict

  def initialize
    @customers = []
  end

  def update
    @customers.each(&:update)
    @timer.update if @timer
  end

  def game_logic
    @customers.each do |cust|
      if cust.active && cust.timer.is_over
        cust.leave(@dict)
        cust.enter_in(1)
        @timer.add_time(-2) if @timer
      end
    end
  end

  def end_checker
    if @timer&.is_over
      @score&.show_score
      @timer.activate(false)
      @textbox.activate(false) if @textbox

      @customers.each(&:remove)
      @customers = []
    end
  end

  def input(key, alt_pressed)
    if key == 'return'
      if @dict&.is_valid(@textbox.text)
        @customers.each do |cust|
          if cust.is_valid(@textbox.text)
            @score.add(@textbox.text.length ** 2)
            cust.leave(@dict)
            cust.enter_in(1)
            @timer.add_time(3)
          end
        end
      end
      @textbox.set("") if @textbox
    else
      @textbox.input(key, alt_pressed) if @textbox&.is_active
    end
  end
end
