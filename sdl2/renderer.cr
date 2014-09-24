class SDL2::Renderer
  getter renderer

  def initialize(@renderer)
  end

  def clear()
    LibSDL2.renderer_clear(renderer)
  end

  def present()
    LibSDL2.renderer_present(renderer)
  end
end
