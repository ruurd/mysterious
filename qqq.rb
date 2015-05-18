require "google-search"

[
    "ruurd pels texel"
].each do |query|
  puts "searching for #{query}"
  Google::Search::Web.new do |search|
    search.query = query
    search.size = :large
  end.each do |item|
    puts item.title
  end
end
