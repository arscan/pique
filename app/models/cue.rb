class Cue < ActiveRecord::Base
  include ActiveUUID::UUID
  attr_accessible :name
end
