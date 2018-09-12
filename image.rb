class Image
  attr_accessor :pixels
  # Histogram to support gray-scale and RGB channels
  # Resolution currently in terms of number of "squares" image will be resolved to
  # All outputs will be square and size will be the width and height in pixels
  def initialize(**args)
    @file = args[:file]
    # @depth = args[:depth]
    # @resolution = args[:resolution]
    # @size = args[:size]
    @pixels = []

    self.to_pixels
  end

  def to_pixels
    File.open(@file, 'r') do |file|
      byte_block = file.read # Hard code byte depth
      byte_block.each_byte do |byte|
        @pixels << byte
      end
    end
    #  Clean up syntax below
    @pixels = @pixels.each_slice(@pixels.length/3).to_a
  end

  def color_block(top_left, bottom_right)
    x_start, x_end, y_start, y_end = [top_left, bottom_right].transpose.flatten
    [*x_start..x_end].product([*y_start..y_end]).each do |pixel|
      png[*pixel] = ChunkyPNG::Color.rgb(219,64,138) # Set to take in average color 
    end
  end

  def print_to_png
    png = ChunkyPNG::Image.new(@size, @size, ChunkyPNG::Color::TRANSPARENT)
    # Refactor below to retrieve blocks from color_block method
    [*0..@size-1].product([*0..@size-1]).each do |xy|
      png[*xy] = ChunkyPNG::Color.rgb(rand(256),rand(256),rand(256))
    end
    png.save('test2.png')
  end

end


# # read_image('image.PNG')
# png = ChunkyPNG::Image.new(200,200,ChunkyPNG::Color::WHITE)



# create_color_block([0,0],[5,5])


# # Extract the each block to a proc and pass in
# [*0..50].product([*0..50]).each do |n|
#   png[*n] = ChunkyPNG::Color.rgb(219,64,138)
# end
# # png[0,100] = ChunkyPNG::Color.rgba(0,0,0,1)
# # png[2,1] = ChunkyPNG::Color.rgba(156,156,156,1)
# png.save('test.png', :interlace => true)