class Event < ApplicationRecord
  # Associações
  has_many :registrations
  has_many :users, through: :registrations

  # Validações
  validates :name, :location, :date, presence: true
  validates :price, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true
  validates :capacity, numericality: { only_integer: true, greater_than: 0 }
end
