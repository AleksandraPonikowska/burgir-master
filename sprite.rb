class MySprite

  def initialize(image_path, x, y)
    @x = x
    @y = y
    @image = Sprite.new("assets/" + image_path, x: @x, y: @y)
  end
  
end
