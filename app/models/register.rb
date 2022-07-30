class Register < ApplicationRecord
    mount_uploader :room_image, RoomImagesUploader
    
    belongs_to :user
    has_many :bookings, dependent: :destroy
end
