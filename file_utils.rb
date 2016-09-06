require "fileutils"


current_dir=Dir.pwd
project_name = "demo"
root="/tmp/#{project_name}"

FileUtils.rm_rf root
FileUtils.mkdir_p root

FileUtils.cd root do  |dir|
  %w(bin lib/demo test/demo).each do |directory|
    FileUtils.mkdir_p directory
  end
  %w(bin/demo Rakefile Gemfile lib/demo.rb test/test_helper.rb).each do |file|
    FileUtils.touch file
  end
  %w(Gemfile).each do |file|
    FileUtils.cp "#{current_dir}/#{file}" , "."
  end
end

