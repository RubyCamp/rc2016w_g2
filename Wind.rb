# coding: utf-8
require_relative 'Character_wind'

class Wind

  def initialize
    @image_wind = Character_wind.new(350, 0, "images/wind.png")
    @flag_browing = false
  end


  def brow_wind
    @image_wind.move
    @image_wind.draw
    #while wind are in window
    if @image_wind.y > 600
      @flag_browing = false
      re_initialize
      puts "wind finish"
    end
  end

  def browing?
    @flag_browing
  end

  def re_initialize
    #@image_wind.each { |wind| wind.set_first_coordinates }
    @image_wind.x= 350
    @image_wind.y= 0
    @flag_browing = false
  end

  def flag_browing=(arg)
    @flag_browing = arg
  end

  def print_wind_coordinates
    print "[0]:#{@image_wind[0].x}, #{@image_wind[0].y}",
          "[1]:#{@image_wind[1].x}, #{@image_wind[1].y}",
          "[2]:#{@image_wind[2].x}, #{@image_wind[2].y}"
  end

end

