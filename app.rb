require_relative 'histogram.rb'
require 'chunky_png'
require 'gruff'
require 'byebug'

image = ChunkyPNG::Image.from_file('obidos.PNG')
histogram = Histogram.new(image)
histogram.display

















# histogram = Histogram.new('image.PNG', depth)
# histogram.get_pixels
# histogram.pixels_to_frequencies
# image = Image.new(histogram, 4, 200)

# p image.histogram

# png = ChunkyPNG::Image.new(32*32, 32*32, ChunkyPNG::Color::TRANSPARENT)
# # loop over grid to make bigger image
# 5.times do |i|
#   x_start, x_end, y_start, y_end = [[depth*i,depth*i], [depth*i+depth-1,depth*i+depth-1]].transpose.flatten
#   [*x_start..x_end].product([*y_start..y_end]).each do |pixel|
#     color = histogram.pick_color
#     png[*pixel] = ChunkyPNG::Color.rgb(color,color,color) if color # Set to take in average color 
#   end
# end
# png.save('test.png', :interlace => true)

# png = ChunkyPNG::Image.new(200,200,ChunkyPNG::Color::WHITE)
# Extract the each block to a proc and pass in
# [*0..50].product([*0..50]).each do |n|
#   color = histogram.pick_color
#   png[*n] = ChunkyPNG::Color.rgb(color, color, color)
# end
# # png[0,100] = ChunkyPNG::Color.rgba(0,0,0,1)
# # png[2,1] = ChunkyPNG::Color.rgba(156,156,156,1)
# png.save('test.png', :interlace => true)

# image_info_1 = {
#   file: 'image.PNG',
#   depth: 18,
#   resolution: 2,
#   size: 200
# }

# image = Image.new(image_info_1)
# image.to_pixels
# png = ChunkyPNG::Image.new(1500,1500,ChunkyPNG::Color::WHITE)
# image.pixels.each_with_index do |pixel, index|
#   png[index%1445, index/1445] = ChunkyPNG::Color.rgb(pixel[0], pixel[1], pixel[2])
# end
# png.save('test5.png', :interlace => true)

# image_info_2 = {
#   file: 'test5.png',
#   depth: 18,
#   resolution: 2,
#   size: 200
# }

# original = Image.new(image_info_1)
# output = Image.new(image_info_2)
# original_pixels = original.pixels
# output_pixels = output.pixels.delete([0,0,0])  

# p original_pixels.length
# p output_pixels.length

# length = 262144
# png = ChunkyPNG::Image.new(512,512,ChunkyPNG::Color::WHITE)
# image.pixels.each_with_index do |pixel, index|
#   png[index%512,index/512] = ChunkyPNG::Color.rgb(pixel, pixel, pixel)
# end
# png.save('test4.png', :interlace => true)

# histogram = Histogram.new(image)
# histogram.calculate_frequencies
# p histogram.values
# @pixels = []
# png_stream = ChunkyPNG::Datastream.from_file('image.PNG')
# # png_stream.each_chunk do |chunk|
# #   p chunk
# # end
# png_stream.imagedata.each_byte do |byte|
#   @pixels << byte 
# end
# p @pixels.length