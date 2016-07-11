require 'dxruby'
require 'smalrubot'
require_relative 'Rock'
require_relative 'Wind'

class Jack < Sprite

  def initialize
    @speed = 10
    @life = 1
    @imageRight = Image.load("images/hito.png")
    @imageLeft = Image.load("images/hito2.png")
    @imageRight.set_color_key([255, 255, 255])
    @sound_asioto = Sound.new("se/asioto.wav")
    @sound_die = Sound.new("se/sibouse.wav")
    @sound_diebgm = Sound.new("se/requiem.wav")
    @start_time = Time.now
    @imageFlag = true
    super(600 , 450 , @imageRight)
  end

  def update(windBrow)
    #@tilt = $board.digital_read(5)
    if windBrow
      speedDown = 8
    else
      speedDown = 0
    end

    if Input.keyDown?(K_LEFT)
      self.x -= @speed - speedDown
    end
    if Input.keyDown?(K_RIGHT)
      self.x += @speed - speedDown
    end
    #		puts "DONE update"
  end

  def wallAction
    if self.x > 940
      self.x -= @speed
    elsif self.x < 200
      self.x += @speed
    end
    #	   	puts "DONE wallAction"
  end

  def draw(windBrow)
    #    	puts "tilt:#{@tilt}"
    self.image = @imageFlag ? @imageRight : @imageLeft
    time = Time.now - @start_time
    if windBrow
      speedDown = 0.5
    else
      speedDown = 0
    end

    if time > 0.5 + speedDown
      @imageFlag = @imageFlag == true ? false : true
      @sound_asioto .stop
      @sound_asioto .play
      @start_time = Time.now
    end
    super()

    if @life < 1
      30.times do
        self.y += 1
      end
    end

    def hit(obj)
      @life -= 1 
      @sound_die.stop
      @sound_die.play
      @sound_diebgm.play 
    if obj.is_a?(Rock)
    end
   end
  end
end
