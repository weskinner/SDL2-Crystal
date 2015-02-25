@[Link("SDL2")]
# @[Link("SDLMain")]
ifdef darwin
  @[Link(framework: "Cocoa")]
end
lib LibSDL2
  INIT_TIMER       = 0x00000001_u32
  INIT_AUDIO       = 0x00000010_u32
  INIT_VIDEO       = 0x00000020_u32
  INIT_CDROM       = 0x00000100_u32
  INIT_JOYSTICK    = 0x00000200_u32
  INIT_NOPARACHUTE = 0x00100000_u32
  INIT_EVENTTHREAD = 0x01000000_u32
  INIT_EVERYTHING  = 0x0000FFFF_u32
  INIT_EVENTS      = 0x00004000_u32

  SWSURFACE = 0x00000000_u32
  HWSURFACE = 0x00000001_u32
  ASYNCBLIT = 0x00000004_u32

  ANYFORMAT  = 0x10000000_u32
  HWPALETTE  = 0x20000000_u32
  DOUBLEBUF  = 0x40000000_u32
  FULLSCREEN = 0x80000000_u32
  OPENGL     = 0x00000002_u32
  OPENGLBLIT = 0x0000000A_u32
  RESIZABLE  = 0x00000010_u32
  NOFRAME    = 0x00000020_u32

  SDL_FIRSTEVENT = 0
  QUIT = 0x100_u16
  WINDOWEVENT = 0x200_u32
  KEYDOWN = 0x300_u16
  KEYUP = 0x301_u16
  MOUSEMOTION = 0x400_u16
  JOYAXISMOTION = 0x600_u16
  CONTROLLERAXISMOTION = 0x650_u16
  FINGERDOWN = 0x700_u16
  DOLLARGESTURE = 0x800_u16
  CLIPBOARDUPDATE = 0x900_u16
  DROPFILE = 0x1000_u16
  USEREVENT = 0x8000_u32
  LASTEVENT = 0xFFFF_u32

  HWACCEL     = 0x00000100_u32
  SRCCOLORKEY = 0x00001000_u32
  RLEACCELOK  = 0x00002000_u32
  RLEACCEL    = 0x00004000_u32
  SRCALPHA    = 0x00010000_u32
  PREALLOC    = 0x01000000_u32

  WINDOW_SHOWN      = 0x00000004_u32
  WINDOW_RESIZABLE  = 0x00000020_u32

  WINDOWPOS_UNDEFINED = 0x1FFF0000
  WINDOWPOS_CENTERED = 0x2FFF0000

  RENDERER_ACCELERATED = 0x00000002_u32
  RENDERER_PRESENTVSYNC = 0x00000004_u32
  RENDERER_TARGETTEXTURE = 0x00000008_u32

  DISABLE = 0
  ENABLE = 1

  FLIP_NONE = 0x00000000

  enum BlendMode
    NONE = 0x00000000
    BLEND = 0x00000001
    ADD = 0x00000002
    MOD = 0x00000004
  end

  enum TextureAccess
    STATIC
    STREAMING
    TARGET
  end

  struct Color
    r, g, b, unused : UInt8
  end

  struct Rect
    x, y : Int32
    w, h : Int32
  end

  struct Palette
    ncolors : Int32
    color : Color
  end

  enum PixelFormatEnum
  #TODO
  end

  struct PixelFormat
    format : PixelFormatEnum
    palette : Palette
    bits_per_pixel, bytes_per_pixel : UInt8
    r_mask, g_mask, b_mask, a_mask : UInt32
  end

  struct Surface
    flags : UInt32
    format : PixelFormat*
    w, h : Int32
    pitch : UInt16
    pixels : Void*
    #TODO
  end

  struct Window
    id : UInt32
    title : Char*
    icon : Surface*
    x, y, w, h : Int32
    min_w, min_h, max_w, max_h : Int32
    flags : UInt32
    #TODO
  end

  struct Renderer
    window : Window*
    #TODO
  end

  struct Texture
    #TODO
  end

  enum Key
    ESCAPE = 27
    A = 97
    B = 98
    C = 99
    D = 100
    E = 101
    F = 102
    G = 103
    H = 104
    I = 105
    J = 106
    K = 107
    L = 108
    M = 109
    N = 110
    O = 111
    P = 112
    Q = 113
    R = 114
    S = 115
    T = 116
    U = 117
    V = 118
    W = 119
    X = 120
    Y = 121
    Z = 122
    UP = 273
    DOWN = 274
    RIGHT = 275
    LEFT = 276
    SPACE = 205
  end

  struct KeySym
    scan_code : UInt8
    sym : Key
    mod : UInt16
    pad : UInt32
  end

  struct KeyboardEvent
    type : UInt32
    timestamp : UInt32
    windowID : UInt32
    state : UInt8
    repeat : UInt8
    key_sym : KeySym
    pad : UInt8[1000] #TODO: other event types
  end

  struct UserEvent
    type : UInt32
    timestamp : UInt32
    windowID : UInt32
    code : Int32
    data1 : Void*
    data2 : Void*
    pad : UInt8[1000] #TODO: other event types
  end

  union Event
    type : UInt32
    key : KeyboardEvent
    user : UserEvent
  end

  struct RWops
  end

  struct Point
  end

  type TimerCallback = (UInt32, Void*) -> UInt32

  fun init = SDL_Init(flags : UInt32) : Int32
  fun get_error = SDL_GetError() : UInt8*
  fun quit = SDL_Quit() : Void
  # fun set_video_mode = SDL_SetVideoMode(width : Int32, height : Int32, bpp : Int32, flags : UInt32) : Surface*
  # fun load_bmp = SDL_LoadBMP(file : UInt8*) : Surface*
  fun create_window = SDL_CreateWindow(title : UInt8*, x : Int32, y : Int32, width : Int32, height : Int32, flags : UInt32) : Window*
  fun destroy_window = SDL_DestroyWindow(Window*) : Void
  fun delay = SDL_Delay(ms : UInt32) : Void
  fun poll_event = SDL_PollEvent(event : Event*) : Int32
  fun wait_event = SDL_WaitEvent(event : Event*) : Int32
  fun push_event = SDL_PushEvent(event : Event*) : Int32

  fun get_window_surface = SDL_GetWindowSurface(window : Window*) : Surface*
  fun lock_surface = SDL_LockSurface(surface : Surface*) : Int32
  fun unlock_surface = SDL_UnlockSurface(surface : Surface*) : Void
  fun update_window_surface = SDL_UpdateWindowSurface(window : Window*) : Int32
  fun free_surface = SDL_FreeSurface(surface : Surface*) : Void

  fun update_rect = SDL_UpdateRect(screen : Surface*, x : Int32, y : Int32, w : Int32, h : Int32) : Void
  fun fill_rect = SDL_FillRect(surface : Surface*, rect : Rect*, c : UInt32) : Int32

  fun show_cursor = SDL_ShowCursor(toggle : Int32) : Int32
  fun get_ticks = SDL_GetTicks : UInt32
  fun flip = SDL_Flip(screen : Surface*) : Int32

  fun create_renderer = SDL_CreateRenderer(window : Window*, index : Int32, flags : UInt32) : Renderer*
  fun destroy_renderer = SDL_DestroyRenderer(renderer : Renderer*) : Void
  fun renderer_clear = SDL_RenderClear(renderer : Renderer*) : Int32
  fun renderer_present = SDL_RenderPresent(renderer : Renderer*) : Int32
  fun renderer_set_color = SDL_SetRenderDrawColor(renderer : Renderer*, r : UInt8, g : UInt8, b : UInt8, a : UInt8) : Int32
  fun renderer_set_blend_mode = SDL_SetRenderDrawBlendMode(renderer : Renderer*, mode : BlendMode) : Int32
  fun set_render_target = SDL_SetRenderTarget(renderer : Renderer*, texture : Texture*) : Int32
  fun render_copy = SDL_RenderCopy(renderer : Renderer*, texture : Texture*, srcrect : Rect*, dstrect : Rect*) : Int32
  fun render_copy_ex = SDL_RenderCopyEx(renderer : Renderer*, texture : Texture*, srcrect : Rect*, dstrect : Rect*, angle : Float64, center : Point*, flip : Int32) : Int32

  fun create_texture_from_surface = SDL_CreateTextureFromSurface(renderer : Renderer*, surface : Surface*) : Texture*
  fun create_texture = SDL_CreateTexture(renderer : Renderer*, format : UInt32, access : TextureAccess, w : Int32, h : Int32) : Texture*
  fun destroy_texture = SDL_DestroyTexture(texture : Texture*) : Void

  fun rw_from_file = SDL_RWFromFile(str1 : UInt8*, str2 : UInt8*) : RWops*
  fun load_bmp_rw = SDL_LoadBMP_RW(rw_ops : RWops*, int : Int32) : Surface*

  fun map_rgb = SDL_MapRGB(format : PixelFormat*, r : UInt8, g : UInt8, b : UInt8) : UInt32

  fun blit_surface = SDL_UpperBlit(src : Surface*, src_rect : Rect*, dst : Surface*, dst_rect : Rect*) : Int32

  fun add_timer = SDL_AddTimer(interval : UInt32, callback : TimerCallback, param : Void*) : Int32
  fun remove_timer = SDL_RemoveTimer(id : Int32) : Int32
end

@[Link("SDL2_ttf")]
lib LibSDL2_TTF
  struct Font
  end

  fun init = TTF_Init() : Int32
  fun quit = TTF_Quit() : Void
  fun open_font = TTF_OpenFont(file : UInt8*, ptsize : Int32) : Font*
  fun render_text_blended = TTF_RenderText_Blended(font : Font*, text : UInt8*, fg : LibSDL2::Color) : LibSDL2::Surface*
  fun render_text_solid = TTF_RenderText_Solid(font : Font*, text : UInt8*, fg : LibSDL2::Color) : LibSDL2::Surface*
end

# undef main
#
# redefine_main(SDL_main) do |main|
#   {{main}}
# end
