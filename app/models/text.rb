class Text < ActiveRecord::Base
  has_many :relations
  has_many :related_texts, through: :relations
end
