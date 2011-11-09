require 'rake'
require 'erb'
require 'pathname'
require 'fileutils'

# Try to preserve symlinks in the relative path
def plugin_path( plugin_name, relative_path=ENV['HOME'] )
  pwd = File.stat(ENV['PWD']) == File.stat(Dir.pwd) ? ENV['PWD'] : Dir.pwd 
  if File.stat(pwd) == File.stat(File.dirname(__FILE__))
    pwd = File.join(pwd, plugin_name) 
  end
  path = Pathname.new(pwd)
  path = path.relative_path_from( Pathname.new(relative_path) ) if relative_path
  path.cleanpath
end

def install_dotfiles( dotfiles )
  plugin = File.basename File.dirname( caller[0].split(':').first )
  dotfiles.each_pair do |src,dest|
    add_plugin_dotfile plugin, src, dest
  end
  add_plugin_install_task( plugin, dotfiles )
end

def add_plugin_dotfile( plugin, src, dest )
  abs_template_path = plugin_path(plugin, nil) + src 
  return unless File.exists? abs_template_path
  file File.expand_path(dest) => abs_template_path do |t|
    if src =~ /\.erb$/
      File.open(t.name.sub(/\.erb/, ''), 'w') do |new_file|
        new_file.write ERB.new( File.read(abs_template_path) ).result(binding)
      end
    else
      rel_template_path = plugin_path(plugin) + src
      symlink rel_template_path, t.name
    end
  end
end

def add_plugin_install_task( plugin, dotfiles )
  desc "Install #{plugin}"
  task :install => "#{plugin}:install"
  namespace plugin.to_sym do
    desc dotfiles.values.join " "
    task :install => dotfiles.values.map { |f| File.expand_path(f) }
  end
end

