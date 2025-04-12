class Registration < ApplicationRecord
  # Associações
  belongs_to :user
  belongs_to :event

  # Validações
  validates :status, presence: true
end
