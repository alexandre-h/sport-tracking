class Seance < ApplicationRecord
  belongs_to :user


  validates :name, presence: true, uniqueness: true
  validates :exercice, presence: true
end
