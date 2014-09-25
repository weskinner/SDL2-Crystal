class SDL2::Window
  getter window
  getter title
  getter x
  getter y
  getter width
  getter height

  def initialize(@title, @x, @y, @width, @height, flags)
    @window = LibSDL2.create_window(title, x, y, width, height, flags)
    if @window.nil?
      raise "Can't create SDL window: #{SDL2.error}"
    end
  end

  def get_surface()
    return LibSDL2.get_window_surface(@window)
  end

end
