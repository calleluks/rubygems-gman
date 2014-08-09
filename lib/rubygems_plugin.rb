require "rubygems/command_manager"
require "rubygems/commands/gman_command"

Gem::CommandManager.instance.register_command :gman

Gem.post_install do |installer|
  Gem::Commands::GmanCommand.new.document(installer.spec)
end
