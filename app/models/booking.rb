class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :tool

  validates :request, length: { minimum: 6 }
  validates :start_date, :end_date, presence: true
end
