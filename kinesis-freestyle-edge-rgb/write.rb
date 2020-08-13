def run(cmd)
    puts "$ #{cmd}"
    `#{cmd}`
end

keyboard = "/Volumes/FS EDGE RGB/" # Mac OS
if `uname -s` =~ /Linux/
    keyboard = "/media/mejibyte/FS EDGE RGB/"
end

if !Dir.exists?(keyboard)
    raise "#{keyboard} doesn't exist. Are you sure V-Drive is active?"
end

puts "Copying layouts..."
1.upto 9 do |i|
    f = "layouts/layout#{i}.txt"
    run "cp #{File.join(__dir__, "data", f)} '#{File.join(keyboard, f)}'"
end

puts "Copying lighting..."
1.upto 9 do |i|
    f = "lighting/led#{i}.txt"
    run "cp #{File.join(__dir__, "data", f)} '#{File.join(keyboard, f)}'"
end

puts "Don't forget to press SmartSet + PROFILE to reload changes!"