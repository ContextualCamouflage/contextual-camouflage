class Interest < ApplicationRecord
  validates_uniqueness_of :email, scope: :topic
end