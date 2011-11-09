Dir.glob('*/Rakefile').each { |f| import f }

task :default do
  puts <<-END
  Manage your personal config files by organizing them in a plugin
  subdirectory. Use a Rakefile to define the file manifest:

  require File.join(File.dirname(__FILE__), '../dotfile_installer.rb')

  install_dotfiles(
    "example.erb" => "~/.example"
  )

  See `rake -T` for the list of defined installers.
  END
end

