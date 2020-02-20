class AvatarEye < ApplicationRecord
  belongs_to :image

  def picture_url
    if self.image
      image.url
    else
      ""
    end 
  end

  # add image from base64 data format (with prefix)
  def picture=(data) 
    # add_image = Image.create!(name: "body_image_#{self.id}", image: data)
    add_image = Image.create!(image: data)
    puts "IMAGE: #{add_image}"
    # destroy prev image
    # self.image.destroy if self.image
    # self.image.delete if self.image
    self.update(image: add_image)
  end

  def self.create!(params)
    basic_params = params.except(:picture)
    avatar_eye  = super

    # add an image to the model
    puts "Picture: #{params[:picture]}"
    avatar_eye.picture = params[:picture] if params[:picture]
    avatar_eye
  end

  def update(params)
    basic_params = params.except(:picture)

    super basic_params
    return {} if params[:image] != nil
    return {} if params[:picture] != nil 

    puts "UPDATES: #{params[:picture]}"

    if params[:picture] == nil
      puts "UPDATES: call delete"
      self.image.delete() if self.image
      self.image = nil
    elsif params[:picture].slice(0,4) == 'data'
      # update the image
      self.picture = params[:picture]
    end
  end

  def destroy
    self.image.destroy
    super
  end
end
