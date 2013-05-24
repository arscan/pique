class Item < ActiveRecord::Base
  belongs_to :cue
  attr_accessible :body
end
