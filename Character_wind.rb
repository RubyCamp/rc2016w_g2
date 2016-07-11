# coding: utf-8

class Character_wind

  def initialize(x, y, image_file)
    @x, @y = x, y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
    @dy = 2
  end

  def move
    #puts "move"
    @x += Math.sin(@y / 10) * 10
    @y += @dy
  end

  def draw
    #puts "draw"
    Window.draw(@x, @y, @image)
  end
  def x
    @x
  end
  def y
    @y
  end

  def x=(arg)
    @x = arg
  end
  def y=(arg)
    @y = arg
  end

end

