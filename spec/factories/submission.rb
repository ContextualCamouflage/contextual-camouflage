FactoryGirl.define do
  factory(:submission) do
    cookie "thisismycookie181489"
    ip_address "96.236.157.31"
    latitude BigDecimal.new("0.405775")
    locality "Sewickley"
    longitude BigDecimal.new("-0.801503")
    relationship "self"
    zip_code "15222"
    illness
  end
end
