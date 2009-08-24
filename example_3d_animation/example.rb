class Example < Processing::App
  attr_accessor :rotx, :roty, :tex, :bg, :rate

  def setup
    size 800, 600, P3D
    self.bg = load_image "candy_2.jpg"
    self.tex = load_image "smile.jpg"
    texture_mode NORMALIZED
    fill 255
    stroke(color(44, 48, 32))
    self.rotx = 0
    self.roty = 0
    self.rate = 0.05
  end

  def draw
    background self.bg
    no_stroke
    translate width/2.0, height/2.0, -100
    rotate_x self.rotx
    rotate_y self.roty
    scale 90
    texture_cube self.tex
    position_update
  end

  private

  def position_update
    self.rotx += rate
    self.roty += rate

    puts "rotx: #{self.rotx}"
    puts "roty: #{self.roty}"
  end

  def texture_cube(tex)
    begin_shape QUADS
    texture tex

    # +Z "front" face
    vertex(-1, -1,  1, 0, 0)
    vertex( 1, -1,  1, 1, 0)
    vertex( 1,  1,  1, 1, 1)
    vertex(-1,  1,  1, 0, 1)

    # -Z "back" face
    vertex( 1, -1, -1, 0, 0)
    vertex(-1, -1, -1, 1, 0)
    vertex(-1,  1, -1, 1, 1)
    vertex( 1,  1, -1, 0, 1)

    # +Y "bottom" face
    vertex(-1,  1,  1, 0, 0)
    vertex( 1,  1,  1, 1, 0)
    vertex( 1,  1, -1, 1, 1)
    vertex(-1,  1, -1, 0, 1)

    # -Y "top" face
    vertex(-1, -1, -1, 0, 0)
    vertex( 1, -1, -1, 1, 0)
    vertex( 1, -1,  1, 1, 1)
    vertex(-1, -1,  1, 0, 1)

    # +X "right" face
    vertex( 1, -1,  1, 0, 0)
    vertex( 1, -1, -1, 1, 0)
    vertex( 1,  1, -1, 1, 1)
    vertex( 1,  1,  1, 0, 1)

    # -X "left" face
    vertex(-1, -1, -1, 0, 0)
    vertex(-1, -1,  1, 1, 0)
    vertex(-1,  1,  1, 1, 1)
    vertex(-1,  1, -1, 0, 1)

    end_shape
  end
end

Example.new :title => "Example 3D With Drag"
