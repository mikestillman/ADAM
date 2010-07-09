
# Franziska Hinkelmann
# July 2010

#$ret = system("ruby control_runner.rb $n_nodes $u_nodes $p_value $functions");

# Takes input from dvd website and passes it to M2 to generate controlled PDS
# returns 0 (no errors) or 1 (errors) 

require 'fileutils'


unless (ARGV.size == 5 or ARGV.size == 7 )
  puts "Usage: ruby control_runner.rb n_nodes u_nodes p_value functions giffile initialState finalState<br>" 
  puts "Initial and final state are optional"
  exit 1
end

n_nodes = ARGV[0].to_i 
u_nodes = ARGV[1].to_i 
p_value = ARGV[2].to_i
function = ARGV[3] 
file = ARGV[4]

traj = "{}" # this is the initial and final state, if heuristic control is desired, otherwise just an empty list
if (ARGV.size == 7 )
  initialState = ARGV[5]
  finalState = ARGV[6]
  initialState = initialState.gsub(/_/, ",")
  finalState = finalState.gsub(/_/, ",")
  traj = "{{#{initialState}}, {#{finalState}}}"
end

#  puts traj

filePrefix = file.split(/gif/).first
#puts "<br>"
#puts function
#puts "<br>"
#puts file 
#puts "<br>"

functionArr = function.split(/\n/)

unless functionArr.size == n_nodes 
  puts "There should be #{n_nodes} functions, but I encountered #{functionArr.size}.<br>"
  exit 1
end

m2_system =  "{{"
functionArr.each { |func|
  ll = func.split(/=/)
  m2_system = m2_system + ll.last 
  m2_system =  m2_system + ","
}

# remove last comma
m2_system.chop!
m2_system = m2_system + "}}"

#puts "<br>"
#puts m2_system
#puts "<br>"

if ( n_nodes < 11 ) 
  if traj != "{}" 
    puts "Finding control heuristicly<br>"
  end
  puts "Generating the phase space ...<br><br>"

  #puts "cd controlM2/; /usr/local/bin/M2 Visualizer.m2 --stop --no-debug --silent -q -e 'QR = makeControlRing(#{n_nodes}, #{u_nodes}, #{p_value}); visualizeControl( matrix(QR, #{m2_system}), #{u_nodes}, #{traj}); exit 0'"
  m2_result = `cd controlM2/; /usr/local/bin/M2 Visualizer.m2 --stop --no-debug --silent -q -e 'QR = makeControlRing(#{n_nodes}, #{u_nodes}, #{p_value}); visualizeControl( matrix(QR, #{m2_system}), #{u_nodes}, #{traj}); exit 0'`

#puts "here"
#puts "<br>"
#puts m2_result 

  if m2_result == "" # empty only if M2 erroed out
    puts "There was a problem with the calculation. Sorry<br>"
    exit 1
  end

  results = m2_result.split("digraph")
  if results.size == 2
    puts "<font color=blue>The following control was applied: </font><br>"
    puts (results.first).gsub(/\n/, "<br>") 
  end

  tmpFile = "#{filePrefix}dot"
  File.open( tmpFile, 'w') {|f| f.write "digraph #{results.last}"}

  dotPath = `which dot`
  dotPath.chop!
  #puts "#{dotPath} -Tgif #{tmpFile} -o #{file}"
  `#{dotPath} -Tgif #{tmpFile} -o #{file}`
else 
  puts "Too many variables to generate the phase space.<br>"
  if traj !="{}" 
    puts "Compute control sequence<br>"
    #puts "cd controlM2/; /usr/local/bin/M2 Controller.m2 --stop --no-debug --silent -q -e 'QR = makeControlRing(#{n_nodes}, #{u_nodes}, #{p_value}); findControl( matrix(QR, #{m2_system}),  {#{initialState}}, {#{finalState}}, #{u_nodes}); exit 0'"
    m2_result = `cd controlM2/; /usr/local/bin/M2 Controller.m2 --stop --no-debug --silent -q -e 'QR = makeControlRing(#{n_nodes}, #{u_nodes}, #{p_value}); findControl( matrix(QR, #{m2_system}),  {#{initialState}}, {#{finalState}}, #{u_nodes}); exit 0'`
    puts m2_result.gsub(/\n/, "<br>") 
  else
    puts "Nothing to do, good bye. <br>"
  end
end

exit 0

puts "<br>"
puts tmpFile
puts "<br>"
puts file
puts "<br>"


exit 0
