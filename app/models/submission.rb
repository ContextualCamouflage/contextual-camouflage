class Submission < ApplicationRecord
  belongs_to :installation, :primary_key => :locality, :foreign_key => :locality
  has_many :anecdotes
  has_many :researches
  validate :double_submit_same_illness
  validates :illness_id, presence: true
  validates :locality, presence: true
  before_save :active_installation

  def geocode_location
    location = Geocoder.search([self.latitude, self.longitude]).first
    set_location(location) if location
  end

private

  def set_location(location)
    self.locality = location.city
    self.zip_code = location.postal_code
    self.latitude = self.latitude + (Random.new.rand(0.000...0.0007) * [1,-1][rand(2)])
    self.longitude = self.longitude + (Random.new.rand(0.000...0.0007) * [1,-1][rand(2)])
  end

  def double_submit_same_illness
    if Submission.exists?(cookie: self.cookie, illness_id: self.illness_id)
      errors.add(:cookie, "User already submitted this illness.")
    end
  end

  def active_installation
    if !Installation.find_by_locality(self.locality).active?
      throw :abort
    end
  end

end
