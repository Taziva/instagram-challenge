FactoryGirl.define do
  factory :post do
    caption "Digital Spring"
    image Rack::Test::UploadedFile.new(Rails.root + 'spec/files/pictures/digital_spring.jpg', 'image/jpg')
  end
end
