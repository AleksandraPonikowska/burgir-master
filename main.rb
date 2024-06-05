# main.rb
require 'ruby2d'
require_relative 'sprite'
require_relative 'score'
require_relative 'dictionary'
require_relative 'textbox'
require_relative 'burger'
require_relative 'customer'
require_relative 'timer'

set title: "burgir master", width: 900, height: 600, resizable: false

tick = 0

bg = MySprite.new('background.png', 0, 0)

score = Score.new('score.png', 0, 0)
textbox = TextBox.new('', 400, 480)
burger = Burger.new('', 0, 0) 

customers = []

dict = Dictionary.new()

(0..2).each do |i|
  customers << Customer.new('cat.png', 400+i*155, 280)  
  customers[i].reset(dict)
  customers[i].enter_in(i)
end


table = MySprite.new('table.png', 0, 0)

textbox = TextBox.new('', 400, 480)
textbox.add_burger(burger)

timer = Timer.new(390, 20, 490, 40, 25)  

update do

  # UPDATES

  customers.each do |cust|
    cust.update
  end
  timer.update

  # LOGIKA

  customers.each do |cust|
      if cust.active && cust.timer.is_over
        cust.leave(dict)
        cust.enter_in(1)
        timer.add_time(-2)
      end
  end

  # ZAKOŃĆZENIE 

  if timer.is_over 

    score.show_score

    timer.activate(false)
    textbox.activate(false)

    customers.each do |cust|
      cust.remove
    end

    customers = []

  end


end


alt_pressed = false

on :key_down do |event|

  if event.key == 'left alt' || event.key == 'right alt'
    alt_pressed = true
  elsif textbox.is_active
    textbox.input(event.key, alt_pressed)
  end

  if event.key == 'return'
    if dict.is_valid(textbox.text) 
      customers.each do |cust|
        if cust.is_valid(textbox.text)
          score.add(textbox.text.length ** 2)
          cust.leave(dict)
          cust.enter_in(1)
          timer.add_time(3)
        end
      end
    end

    textbox.set("")
  end
end


on :key_up do |event|
  if event.key == 'left alt' || event.key == 'right alt'
    alt_pressed = false
  end
end

show
