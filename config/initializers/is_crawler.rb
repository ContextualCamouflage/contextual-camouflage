{
  apple: 'Applebot',
  arefs: 'AhrefsBot',
  blexbot: 'BLEXBot',
  dotbot: 'DotBot',
  mailru: 'Mail.RU_Bot',
  magestic12: 'MJ12bot',
  seznam: 'SeznamBot'  
}.each do |internal_name, agent_string|
  Crawler::CUSTOM << Crawler.new(internal_name, agent_string)
end