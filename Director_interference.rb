require 'smalrubot'
require_relative 'Wind'
require_relative 'Rock'
require_relative 'Character_ufo'
require_relative 'count012'
require_relative 'scroll'

class Director_interference

  attr_accessor :jack, :sound_wind
  def getJack
    @jack
  end

  def initialize
    #wind sprite data
    @wind = Wind.new
    #stone sprite data
    @rocks = []
    @windCharger = 0
    @windSensorCount = 0
    @ufo_red = Character_ufo.new(200, 10, "images/ufoR.png")
    @ufo_blue = Character_ufo.new(600, 10, "images/ufoB.png")
    @score_timer = ScoreTimer.new
    @jack = Jack.new
    @windIfUpdate = 0
    @background = Scrollobj.new( "images/haikaihaikei001.png",-4137 )
    @sound_stone =Sound.new("se/ya_.wav")
    @sound_wind = Sound.new("se/wind.wav")
    puts "Initializing of Wind done."
  end

  def check_stone
    @rocks.reject!{|rock| rock.vanished? } #Rejecting of invalid balls
  end
  def draw_stone
    Sprite.draw(@rocks)
  end
  def update_stone
    Sprite.update(@rocks)
  end
  


  def play
    #@mike = Input.keyDown?(K_M)
    #w Key -> brow wind
    #p @mike
    #print "@windIfUpdate:#{@windIfUpdate}\n"
=begin
    if @windIfUpdate + 100 <= @mike
       @windIfUpdate = @mike
    end
=end

    if  Input.keyPush?(K_M)
      #puts "start wind"
      @windCharger += 1
      p @windCharger
      if @windCharger == 20
   
     @sound_wind.stop
        @sound_wind.play
        @wind.flag_browing = true
       end
    end
    if @wind.browing?
      #puts "brow"
      @wind.brow_wind
      @windCharger = 0
    end

    #@switch_red = Input.keyPush?(K_R)
    #@switch_blue = Input.keyPush?(K_B)
    #s key -> shoot stone
    if Input.keyPush?(K_R) && @ufo_red.shootOK?
       @ufo_red.set_rock_spawn_wait(20)
       rock = Rock.new(@ufo_red.getX, 30)
       @rocks << rock
       @sound_stone.stop
       @sound_stone.play
    end
    if Input.keyPush?(K_B) && @ufo_blue.shootOK?
       @ufo_blue.set_rock_spawn_wait(20)
       rock = Rock.new(@ufo_blue.getX, 30)
       @rocks << rock
       @sound_stone.stop
       @sound_stone.play
    end
    @ufo_red.ufoAction
    @ufo_blue.ufoAction

    check_stone
    update_stone

    #Jack's action
    @jack.update(@wind.browing?)
    @jack.wallAction

    Sprite.check(@rocks,@jack)

    @jack.draw(@wind.browing?)
    draw_stone

    @background.loopScroll
    @background.draw

  end

end
