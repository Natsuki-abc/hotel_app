class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :profile, presence: true, length: {maximum: 300}
  validates :icon, presence: true
  validates :name, presence: true

  mount_uploader :icon, IconsUploader

  has_many :registers, dependent: :destroy
  has_many :bookings, dependent: :destroy
end
