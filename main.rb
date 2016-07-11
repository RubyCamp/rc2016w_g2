# coding: utf-8

require 'dxruby'
require_relative 'jack'
require_relative 'count012'
require_relative 'Director_interference'

Window.caption = "Interference test"
Window.width   = 1200
Window.height  = 900
#$board = Smalrubot::Board.new(Smalrubot::TxRx::Serial.new)
sound_bgm = Sound.new("se/a_majic_wand01.wav")
sound_fanfaure = Sound.new("se/fanfaure.wav")
sound_fanfaurebgm = Sound.new("se/godbgm.wav")
image_bg = ()#background
interference_director = Director_interference.new #stone and wind
score_timer = ScoreTimer.new
pushcnt=0


flag_game_start = true
sound_bgm.stop
sound_bgm.play

Window.loop do
#  Window.draw(0, 0, image_bg) #drawing of background
  break if Input.keyPush?(K_ESCAPE)
  score_timer.scene
  if score_timer.scene_name == :timer
    interference_director.play #drawing of stone and wind
  elsif score_timer.scene_name == :opening_2
    score_timer.scene_name = :timer
  end
# p score_timer.score
  if Input.keyPush?(K_RETURN) && flag_game_start #game start
    flag_game_start = false
    pushcnt=1
    score_timer.scene_name = :opening_2
  elsif interference_director.jack.y > 900  && pushcnt==1#game over
    score_timer.scene_name = :bad_end
    interference_director.sound_wind.stop
    sound_bgm.stop
    image_bg = Image.load("images/background_gameover.png")
  elsif score_timer.score >= 100 && score_timer.score < 100.2 && pushcnt==1  #game clear
    score_timer.scene_name = :good_end
    interference_director.sound_wind.stop
    sound_bgm.stop
    sound_fanfaure.play
    sound_fanfaurebgm.play
    image_bg = Image.load("images/background_gameclear.png")
  end

end

