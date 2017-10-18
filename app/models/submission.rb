class Submission < ApplicationRecord
  belongs_to :installation, :primary_key => :locality, :foreign_key => :locality
  has_many :anecdotes
  has_many :researches
  validate :double_submit_same_illness
  before_save :geocode_location
  before_save :active_installation

  def geocode_location
    downtown_check
    location = Geocoder.search(self.ip_address, ip_address: true).first
    location.data["city"].present? ? set_location(location) : set_pittsburgh(location)
    set_location(location) if location.data["city"].present?
  end

private

  def set_location(location)
    self.locality = location.data["city"]
    self.zip_code = location.data["zip_code"]
    self.latitude = location.data["latitude"] + (Random.new.rand(0.000...0.0007) * [1,-1][rand(2)])
    self.longitude = location.data["longitude"] + (Random.new.rand(0.000...0.0007) * [1,-1][rand(2)])
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

  def downtown_check
    # 23.25.80.129 is not currently showing any locality results from FreeGeoIP
    self.ip_address = '216.92.192.114' if self.ip_address == '23.25.80.129'
  end

end
