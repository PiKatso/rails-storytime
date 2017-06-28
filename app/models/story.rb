class Story < ApplicationRecord
  validates :title, :presence => true
  has_many :sentences
end
