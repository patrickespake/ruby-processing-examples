class Example < Processing::App
  def setup
    fill 255, 255, 0
    my_font = create_font "", 32
    text_font my_font
    text_align CENTER
    text "Example 2D", 10, 50, 800, 50
  end

  def draw
    c = color rand(255), rand(255), rand(255)
    fill c
    text range_rand(33, 126).chr, range_rand(32, width - 32), range_rand(80, height - 32)
    puts frame_rate
  end

  private

  def range_rand(min, max)
    min + rand(max - min)
  end
end

Example.new :title => "Example 2D", :width => 800, :height => 600
