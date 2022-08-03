class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :profile, length: {maximum: 300}

  mount_uploader :icon, IconsUploader

  has_many :registers, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
