FactoryGirl.define do
  factory(:installation) do
    active true
    active_at "2017-01-01T00:00 UTC"
    latitude BigDecimal.new("0.405775")
    locality "Sewickley"
    longitude BigDecimal.new("-0.801503")
  end
end
