def run(cmd)
    puts "$ #{cmd}"
    `#{cmd}`
end

keyboard = "/Volumes/ADVANTAGE2/"
if !Dir.exists?(keyboard)
    raise "#{keyboard} doesn't exist. Are you sure V-Drive is active? Use Progrm + F1 to activate it."
end

puts "Copying active..."
Dir.glob(File.join(__dir__, "data/active/*.txt")).each do |f|
    run "cp #{f} '#{File.join(keyboard, "active", File.basename(f))}'"
end

puts "To reload changes, do one of these two:"
puts "1) Reload layout by pressing Progrm + m (or any other layout letter, see README)"
puts "2) Eject drive and disable V-Drive by pressing Progrm + F1"