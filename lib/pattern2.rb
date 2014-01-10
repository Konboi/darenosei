class Pattern2
  def initialize
    @image = Magick::Image.new(1680, 1050) {
      self.background_color = "none"
    }
    frame = Magick::ImageList.new("#{Rails.root}/data/image/yuki_02_b.jpg")
    @image = @image.composite(frame, 0, 0, Magick::OverCompositeOp)
  end

  def write(who, degree)
    fontsize = 90
    md = Magick::Draw.new
    md.font = "#{Rails.root}/data/font/bokutachi.otf"
    md.pointsize = fontsize
    y = 100
    x = 1550
    degree_array = degree.split(//)
    degree_array.each do |msg|
      msg = msg.slice(0, 40) if msg.length > 40
      md.annotate(@image, 0, 0, x, y, msg ) {
        self.fill = "#000000"
        self.kerning = -1.3
      }
      y = y + 90
    end

    total_length = who.length + degree.length + 4
    if total_length > 10
      x = x - 100
      y = 200
    end

    who_array = who.split(//)
    who_array.each do |msg|
      msg = msg.slice(0, 40) if msg.length > 40
      md.annotate(@image, 0, 0, x, y, msg ) {
        self.fill = "#000000"
        self.kerning = -1.3
      }
      y = y + 90
    end

    if total_length > 10 && who.length >= 5
      x = x - 100
      y = y - 200
    end

    last_ward = "のせいだ"
    last_ward_array = last_ward.split(//)
    last_ward_array.each do |msg|
      msg = msg.slice(0, 40) if msg.length > 40
      md.annotate(@image, 0, 0, x, y, msg ) {
        self.fill = "#000000"
        self.kerning = -1.3
      }
      y = y + 90
    end


  end

  def save
    save_path = "/uploads/image/#{Time.now.to_i}.jpg"
    FileUtils.mkdir_p("#{Rails.public_path}/uploads/image") unless File.exists?("#{Rails.public_path}/uploads/image")
    @image.write("#{Rails.public_path}#{save_path}")

    save_path
  end
end
