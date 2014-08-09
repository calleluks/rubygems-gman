require "rubygems/command"
require "rdoc"
require "rdoc/generator/mdoc"

class Gem::Commands::GmanCommand < Gem::Command
  def initialize
    super "gman", "Generate and install man pages for gems"
  end

  def execute
    Gem::Specification.each do |gem|
      say "Generating man pages for #{gem.full_name}..."
      document(gem)
    end
  end

  private

  def document(gem)
    RDoc::RDoc.new.document [
      "-q",
      "-f", "mdoc",
      "--section", "#{mandb_section(gem)}",
      "-o", "#{output_directory}",
      *Dir.glob(gem.lib_dirs_glob),
    ]
  rescue => exception
    say "Failed to generate man pages for #{gem.full_name} (#{exception})."
  end

  def output_directory
    File.join(Dir.home, ".man")
  end

  def mandb_section(gem)
    "3-rubygems-#{gem.name}-#{gem.version.to_s.gsub(".", "-")}"
  end
end
