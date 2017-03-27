class Appearance < ApplicationRecord
  belongs_to :guest
  belongs_to :episode
  belongs_to :user, optional: true
  validates :rating, numericality: {greater_than: 0}
  validates :rating, numericality: {less_than: 6}
end
