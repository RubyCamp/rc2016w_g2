require 'dxruby'

class Scrollobj < Sprite
  def initialize( image,syoki_y )
    @background = Image.load( image )
    x = 0
    @syoki_y = syoki_y
    y = @syoki_y
    self.z = -100
    super( x,y,@background )
  end

  def loopScroll
    self.y += 1.35
    if self.y >= 0
      self.y = @syoki_y
    end
  end
end


