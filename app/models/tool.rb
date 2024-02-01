class Tool < ApplicationRecord
  belongs_to :user

  has_one_attached :photo

  has_many :bookings
  has_many :users, through: :bookings

  validates :name, :category, :location, presence: true
end
