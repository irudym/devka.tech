class Tag < ApplicationRecord
  has_and_belongs_to_many :questions
  validates_uniqueness_of :text
end
