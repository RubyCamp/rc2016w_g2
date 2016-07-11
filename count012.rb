require 'dxruby'
class ScoreTimer
  attr_accessor :scene_name

  def initialize
    @font0 = Font.new(40)
    @font1 = Font.new(100)
    @font2 = Font.new(80)
    @font_gameover = Font.new(100)
    @font_gameclear = Font.new(100)
    @time0 = Time.now
    @trg=0
    @time = Time.now
    @finished_time = nil
    @scene_name = :opening_1
  end

  def scene
    __send__(@scene_name)
  end

  def opening_1
    Window.draw_font(280,120, "Are you ready? ", @font0)
    Window.draw_font(280,170, "push Enter key", @font0)
  end
  def opening_2
    @time = Time.now
  end

  def timer
    @time ||= Time.now
    #puts(Time.now)
    Window.draw_font(650, 20, "SCORE", @font1)
    Window.draw_font(650, 130, "#{format('%.2f',score)}m", @font2)
  end

  def current_time(time = Time.now)
    time - @time
  end

  def score
    current_time / 0.5
  end

  def finished_score
    current_time(@finished_time) / 0.5
  end

  def good_end
    @finished_time ||= Time.now
    #Window.draw_font(450, 250, "Game Clear!", @font_gameover)
    Window.draw_font(400, 500, "SCORE", @font_gameclear, :color=>[192, 70, 70])
    Window.draw_font(400, 600,
                     "#{format('%.2f', finished_score.to_s)}m", @font_gameclear,
                     :color=>[192, 100, 100])
  end

  def bad_end
    @finished_time ||= Time.now
    #Window.draw_font(450, 250, "Game Over!", @font_gameover)
    Window.draw_font(400, 500, "SCORE", @font_gameover, :color=>[255, 255, 255])
    Window.draw_font(400, 600,
                     "#{format('%.2f', finished_score.to_s)}m", @font_gameover,
                     :color=>[255, 255, 255])
  end
end

# Window.width = 800
# Window.height= 600

# score_timer = ScoreTimer.new

# Window.loop do
#   score_timer.scene
#   if Input.keyPush?(K_RETURN)
#     score_timer.scene_name = :timer
#   elsif Input.keyPush?(K_RSHIFT)
#     score_timer.scene_name = :ending
#   end
# end

