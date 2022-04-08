def run(cmd)
    puts "$ #{cmd}"
    `#{cmd}`
end


possible_locations = [
    "/Volumes/FS EDGE RGB/", # Mac OS,
    "/media/mejibyte/FS EDGE RGB/", # Ubuntu, I think?
    "/run/media/mejibyte/FS EDGE RGB/", # Arch Linux
]

keyboard = possible_locations.find{ |path| Dir.exists?(path) }
if keyboard.nil?
    raise "Are you sure V-Drive is active? None of these locations exist: #{possible_locations}"
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