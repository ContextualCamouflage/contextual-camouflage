class Installation < ApplicationRecord
  has_many :submissions, :primary_key => :locality, :foreign_key => :locality
  after_create :set_locality

  private

  def set_locality
    map = Geocoder.search([self.latitude, self.longitude])
    self.locality = map.first.data["address_components"].third["long_name"] if map.present?
    self.save!
  end
end
