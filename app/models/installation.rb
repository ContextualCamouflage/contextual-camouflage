class Installation < ApplicationRecord
  has_many :submissions, :primary_key => :locality, :foreign_key => :locality
  
end
