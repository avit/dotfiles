desc "Install all"
task :install do
end

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

# Load oh-my-zsh from a submodule
if File.exists?('zsh')
  namespace :zsh do
    file File.expand_path("~/.zshrc") do
      zsh_path = plugin_path('zsh',nil)
      ENV['ZSH'] = zsh_path.to_s
      sh "sh #{zsh_path}/tools/install.sh"
    end
    desc "~/.zshrc"
    task :install => "~/.zshrc"
  end
  desc "zsh"
  task :install => ["zsh:install"]
end
