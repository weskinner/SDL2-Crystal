require "./*"

module SDL2
  def self.run(flags = LibSDL2::INIT_EVERYTHING)
    init flags
    yield
    quit
  end

  def self.init(flags = LibSDL2::INIT_EVERYTHING)
    if LibSDL2.init(flags) != 0
      raise "Can't initialize SDL: #{error}"
    end
  end

  def self.create_window(title, x, y, width, height, flags)
    window = LibSDL2.create_window(title, x, y, width, height, flags)
    if window.nil?
      raise "Can't create SDL window: #{error}"
    end
    Window.new(window, title, x, y, width, height)
  end

  def self.create_renderer(window, index, flags)
    render = LibSDL2.create_renderer(window.window, index, flags)
    if render.nil?
      raise "Can't create SDL render: #{error}"
    end
    Renderer.new(render)
  end

  # def self.load_bmp(file_name)
  #   surface = LibSDL2.load_bmp(file_name)
  #   if surface.nil?
  #     raise "Can't load \"#{file_name}\": #{error}"
  #   end
  #   Surface.new(surface, 10, 10, 0_u32)
  # end

  def self.show_cursor
    LibSDL2.show_cursor LibSDL2::ENABLE
  end

  def self.hide_cursor
    LibSDL2.show_cursor LibSDL2::DISABLE
  end

  def self.error
    String.new LibSDL2.get_error
  end

  def self.ticks
    LibSDL2.get_ticks
  end

  def self.quit
    LibSDL2.quit
  end

  def self.poll_events
    while LibSDL2.poll_event(out event) == 1
      yield event
    end
  end
end
