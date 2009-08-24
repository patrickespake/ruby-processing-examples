class Example < Processing::App
  load_library :objloader
  import "saito.objloader"

  def setup
    size 800, 600, P3D
    @model = OBJModel.new(self, "m1.obj")
    @rot_x = 0
    @rot_y = 0
  end

  def draw
     background 51
     no_stroke
     lights
     smooth

     push_matrix
     translate width/2, height/2, 0
     rotate_x @rot_y
     rotate_y @rot_x
     scale 3
     @model.drawMode POLYGON
     @model.draw
     pop_matrix
  end

  def mouse_dragged
    @rot_x += (mouse_x - pmouse_x) * 0.01;
    @rot_y -= (mouse_y - pmouse_y) * 0.01;
  end
end

Example.new :title => "Example 3D With .OBJ Loader"
