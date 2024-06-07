# main.rb

require 'ruby2d'
require_relative 'score'
require_relative 'dictionary'
require_relative 'textbox'
require_relative 'burger'
require_relative 'customer'
require_relative 'timer'
require_relative 'game_manager'

set title: "burgir master", width: 900, height: 600, resizable: false

game_manager = GameManager.new

##### creating objects #####

bg = MySprite.new('background.png', 0, 0)
score = Score.new('score.png', 0, 0)
timer = Timer.new(390, 20, 490, 40, 25)
dict = Dictionary.new

customers = []
(0..2).each do |i|
  customer = Customer.new('cat.png', 400 + i * 155, 280)
  customer.reset(dict)
  customer.enter_in(i)
  customers << customer
end

table = MySprite.new('table.png', 0, 0)
textbox = TextBox.new('', 400, 480)

burger = Burger.new('', 0, 0)
textbox.add_burger(burger)

##### adding objects go game manager #####

game_manager.score = score
game_manager.textbox = textbox
game_manager.timer = timer
game_manager.dict = dict
game_manager.customers = customers

##### game managing #####

update do
  game_manager.update
  game_manager.game_logic
  game_manager.end_checker
end

alt_pressed = false

on :key_down do |event|
  if event.key == 'left alt' || event.key == 'right alt'
    alt_pressed = true
  else
    game_manager.input(event.key, alt_pressed)
  end
end

on :key_up do |event|
  alt_pressed = false if event.key == 'left alt' || event.key == 'right alt'
end

show
