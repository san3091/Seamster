class Relation < ActiveRecord::Base
  belongs_to :text
  belongs_to :related_text, class_name: "Text"
end
