class Sentence < ApplicationRecord
  validates :content, :author, :presence => true
  belongs_to :story
  belongs_to :image
end
