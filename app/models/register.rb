class Register < ApplicationRecord
    mount_uploader :room_image, RoomImagesUploader

    validates :room_name, presence: true
    validates :introduction, presence: true, length: {maximum: 300}
    validates :price, presence: true
    validates :address, presence: true
    validates :room_image, presence: true

    belongs_to :user
    has_many :bookings, dependent: :destroy
end
