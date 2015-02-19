class SDL2::Renderer
  getter renderer

  def initialize(window, index, flags)
    render = LibSDL2.create_renderer(window.window, index, flags)
    if render.nil?
      raise "Can't create SDL render: #{SDL2.error}"
    end
  end

  def clear()
    LibSDL2.renderer_clear(renderer)
  end

  def present()
    LibSDL2.renderer_present(renderer)
  end
end
