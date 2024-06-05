# mysprite.rb
class MySprite
    attr_reader :x, :y
  
    def initialize(image_path, x, y)
      @x = x
      @y = y
      @object = Sprite.new("assets/" + image_path, x: @x, y: @y)
    end
  
    def remove
      @object.remove
    end

    def set_pos(x,y)
        @x = x
        @y = y
        @object.x = @x
        @object.y = @y
    end

    def set_img(image_path)
        fixed_path = "assets/" + image_path
        if @object.path != fixed_path
            @object.remove
            @object = Sprite.new(fixed_path, x: @x, y: @y)
        end
    end

  end
  