puts "Project name?"
puts `open https://www.youtube.com/watch?v=dQw4w9WgXcQ`
name = gets.chomp
puts `mkdir ../#{name}`
puts `mkdir ../#{name}/lib ../#{name}/spec`
gemfile_content = "source 'https://rubygems.org'\ngem 'rspec'\ngem 'pry'"
File.write("../#{name}/Gemfile",gemfile_content)
puts "Enter the class names below (separate by space)"
classes = gets.chomp

classes = classes.split(" ")
classes.each do |theClass|
  mainContent = "class #{theClass.capitalize}\nend"
  specContent = "require '#{theClass.downcase}'\n\ndescribe('#{theClass.capitalize}') do\nend"
  File.write("../#{name}/lib/#{theClass.downcase}.rb",mainContent)
  File.write("../#{name}/spec/#{theClass.downcase}_spec.rb",specContent)
end
