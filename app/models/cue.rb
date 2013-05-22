class Cue < ActiveRecord::Base
  include ActiveUUID::UUID
  attr_accessible :name
  has_many :items
end
