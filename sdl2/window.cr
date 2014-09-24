class SDL2::Window
  getter window
  getter title
  getter x
  getter y
  getter width
  getter height

  def initialize(@window, @title, @x, @y, @width, @height)
  end
end
