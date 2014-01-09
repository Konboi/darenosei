class ImageGenerator
  def initialize
    generate_image = [
      Pattern1.new,
    ]
    @image = generate_image.sample
  end

  def write(who, degree)
    @image.write(who, degree)
  end

  def save
    @image.save
  end
end
