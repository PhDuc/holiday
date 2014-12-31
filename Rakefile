# Rake tasks to parse haml layouts, includes and index files and sass files for jekyll
# Assumes that the haml files are in (_layouts|_includes)/_haml
# and the sass files are in css/_sass

namespace :haml do
  require 'haml'

  def convert file, destination
    base_name = File.basename(file, '.haml') + '.html'
    html = File.open(file, 'r') { |f| Haml::Engine.new(f.read).render }
    # Adding meta data to index.html
    if file == 'index.haml'
      html = "---\nlayout: default\ntitle: Welcome\n---\n\n" + html
    end
    File.open(File.join(destination, base_name), 'w')  do |f|
      f.write html
    end
  end

  desc 'Parse haml layout files'
  task :layouts do
    Dir.glob('_layouts/_haml/*.haml') do |path|
      convert path, '_layouts'
    end

    puts 'Parsed haml layout files'
  end

  desc 'Parse haml include files'
  task :includes do
    Dir.glob('_includes/_haml/*.haml') do |path|
      convert path, '_includes'
    end

    puts 'Parsed haml include files'
  end

  desc 'Parse haml index files'
  task :indexes do
    Dir.glob('**/index.haml') do |path|
      convert path, File.dirname(path)
    end

    puts 'Parsed haml index files'
  end

end

desc 'Parse all haml items'
task haml: ['haml:layouts', 'haml:includes', 'haml:indexes']

desc 'Parse sass files'
task :sass do
  require 'sass'

  css = File.open('css/_sass/main.sass', 'r') { |f| Sass::Engine.new(f.read).render }
  File.open('css/main.css', 'w') { |f| f.write css }

  puts 'Parsed main.sass'
end

desc 'Build all haml and sass files for deployment'
task build: [:haml, :sass]
