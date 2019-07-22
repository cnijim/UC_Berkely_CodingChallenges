class Image
  def initialize(imageData)  
    @@degugMode = false
    @imageData = imageData  
    @@hits = []
    @@blurred_coordinates = []
    @@filtered_blurred_coordinates = []
    @@imageWidth = @imageData[0].count - 1
    @@imageHeight = @imageData.count - 1
    if @@degugMode
      puts "imageWidth %s" % @@imageWidth
      puts "imageHeight %s" % @@imageHeight
      puts ""
    end
  end  

  def blur_image(distance)
    count = 0 
    self.find_hit_coordinates
    while count < distance
      self.blur_hit_coordinates
      self.filter_blurred_coordinates
      count = count +1
    end
    self.render_image
  end

  def find_hit_coordinates
    #out of the original data, find the coordiantes of all 1's
    #coordinates start with 0,0 at the top left
    row = 0
    column = 0
    @imageData.each do |line|
      line.each do |bit|
        if bit == 1
          @@hits.push([column,row])
        end
        column = column + 1
      end
      column = 0
      row = row + 1
    end
  end

  def blur_hit_coordinates
    #create a blur around each hit coordinate
    if @@degugMode
      puts "Original Coordiates:"
      print @@hits
      puts ""
    end
    @@hits.each do |coordinate|
      rowIndex = coordinate[0]
      columnIndex = coordinate[1]
      rightCoord = [rowIndex+1 , columnIndex]
      leftCoord = [rowIndex-1 , columnIndex]
      bottomCoord = [rowIndex , columnIndex+1]
      topCoord = [rowIndex , columnIndex-1]
      @@blurred_coordinates << coordinate
      @@blurred_coordinates << rightCoord
      @@blurred_coordinates << leftCoord
      @@blurred_coordinates << bottomCoord
      @@blurred_coordinates << topCoord
    end
    if @@degugMode
      puts "All Blurred Coordiates:"
      print @@blurred_coordinates
      puts ""
    end
  end

  def filter_blurred_coordinates 
    #finds out of range coordinates
    @@blurred_coordinates.each do |coordinate|
      if !(coordinate[0] < 0 || coordinate[0] > @@imageWidth || coordinate[1] < 0 || coordinate[1] > @@imageHeight)
        @@filtered_blurred_coordinates << coordinate
      end
    end
    if @@degugMode
      puts "Flitered Blurred Coordiates:"
      print @@filtered_blurred_coordinates
      puts ""
      puts ""
    end
    @@hits = @@filtered_blurred_coordinates
  end 


  def render_image
    x = 0 
    y = 0
    while y <= @@imageHeight
      while x <= @@imageWidth
        if @@filtered_blurred_coordinates.include? [x,y]
          print 1
        else
          print 0
        end
        x = x+1
      end
      puts ""
      x = 0
      y = y+1
    end
  end

  def output_image
    #prints the image
    @imageData.each do |row|
      row.each do |bit|
        print bit
      end
      puts ""
    end
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
])

image.blur_image(2)
