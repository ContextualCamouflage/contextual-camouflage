class Submission < ApplicationRecord
  belongs_to :installation, :primary_key => :locality, :foreign_key => :locality
  has_many :anecdotes
  has_many :researches
  # before_save :geocode_location
  # validate :double_submit_same_illness

private

  def geocode_location
    location = Geocoder.search(self.ip_address, ip_address: true).first
    self.city = location.data["city"]
    self.zip_code = location.data["zip_code"]
  end

  def double_submit_same_illness
    if Submission.exists?(cookie: self.cookie, illness_id: self.illness_id)
      errors.add(:cookie, "User already submitted this illness.")
    end
  end
end
