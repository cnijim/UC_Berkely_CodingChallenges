class Image
  def initialize(imageData)  
    @imageData = imageData  
  end  

  def output_image
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
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image


