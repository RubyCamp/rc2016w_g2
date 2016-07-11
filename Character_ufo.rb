

class Character_ufo
  attr_accessor :rock_spawn_wait
  
  def initialize(x, y, image_file)
    @x, @y = x, y
    @image = Image.load(image_file)
    @image.set_color_key([0, 0, 0])
    @rock_spawn_wait=0
    @dx = 12
  end

  def ufoAction
    move
    draw
    @rock_spawn_wait -= 1
  end

  def shootOK?
    return @rock_spawn_wait < 0
  end
  
  def set_rock_spawn_wait(value)
    @rock_spawn_wait = value
  end
  
  def move
    @x += @dx
    @dx = -@dx if @x > 900 || @x < 200
  end

  def draw
    Window.draw(@x, @y, @image)
  end

  def getX
    return @x
  end

end


