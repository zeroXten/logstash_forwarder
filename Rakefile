task :foodcritic do
  sh "foodcritic ."
end

task :rubocop do
  sh "rubocop"
end

task :kitchen_test do
  sh "kitchen test"
end

task :cucumber do
  sh "cucumber"
end

task :lint => [ :foodcritic, :rubocop ]
task :test => [ :kitchen_test ]
task :spec => [ :cucumber ]
task :full => [ :lint, :test, :spec ]
