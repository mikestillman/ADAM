# petri-converter $clientip.spped $filename $valuesFile

# Takes Snoopy file and converts it to a PDS so DVD can run calculations
# returns 0 (no errors) or 1 (errors) 

unless ARGV.size == 2
  puts "Usage: ruby petri-converter.rb clientip k-bound"
  exit 1
end

clientip = ARGV[0]
pvalue = ARGV[1]

puts "Here comes a #{pvalue}-bounded petri net!<br>";

puts "<pre>"
puts `ruby petri_parser.rb #{clientip}.spped #{pvalue}`
puts "</pre>"

puts "Done parsing the Snoopy file.<br>"
exit 0

###