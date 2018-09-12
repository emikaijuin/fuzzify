class Histogram
  attr_reader :red_channel, :green_channel, :blue_channel

  def initialize(image)
    # Requires image generated from ChunkyPNG Library
    @image = image

    # Initialize all color channels within RGB color space
    @red_channel =  Hash[[*0..255].map {|v| [v,0]}] 
    @blue_channel =  Hash[[*0..255].map {|v| [v,0]}]
    @green_channel =  Hash[[*0..255].map {|v| [v,0]}]
    
    # Store relation between color name, instance variables, and ChunkyPNG color channel methods
    @channels = {
      "red" => {
        v: @red_channel,
        m: :r
      },
      "blue" => {
        v: @blue_channel,
        m: :b
      },
      "green" => {
        v: @green_channel,
        m: :g
      }
    }

    # Populate channels upon creating a new histogram 
    self.create_channels
    end
    

  # Creates red, green, or blue channel depending on input
  def create_channels
    @channels.each do |k, v|
      @image.pixels.each do |pixel|
        @channels[k][:v][ChunkyPNG::Color.send(@channels[k][:m], pixel)] += 1
      end
    end
  end

  def generate_graph_data(*args)
    # If no args are given, print all channels
    if args.empty?
      @channels.each_with_object([]) do |(k, v), a|
        a << [k.to_sym, v[:v].values, k]
      end
    # Otherwise, print specified channels
    else 
    end

  end

  def display(*args)
    g = Gruff::Area.new
    generate_graph_data(*args).each do |channel|
      g.data(channel[0], channel[1], channel[2])
    end
    g.hide_line_markers = true
    g.write('obidos_histogram.png')
  end
  
end