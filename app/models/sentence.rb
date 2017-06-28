class Sentence < ApplicationRecord
  validates :content, :author, :image_id, :presence=> true
  belongs_to :story
  belongs_to :image
end
