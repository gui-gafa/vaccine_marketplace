module ApplicationHelper
  def randomize_image
    images = ["1.jpeg", "2.jpeg", "3.jpeg", "4.jpeg", "5.jpeg", "6.jpeg", "7.jpeg"]
    images[rand(images.size)]
  end
end
