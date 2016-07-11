class Rock < Sprite
  def initialize(x, y, image = nil)
    image = Image.load("images/isi.png")
    image.set_color_key([0, 0, 0])
    super
    @dy = 7
  end

  def update
    self.y += @dy
  end

  def shot(obj)
    vanish if self.y > 600
  end
end
