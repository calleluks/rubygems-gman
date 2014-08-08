require "rubygems/command"
require "rdoc"
require "rdoc/generator/mdoc"

class Gem::Commands::GmanCommand < Gem::Command
  def initialize
    super "gman", "Generate and install man pages for gems"
  end

  def execute
    Gem::Specification.each { |gem| document(gem) }
  end

  private

  def document(gem)
    RDoc::RDoc.new.document [
      "-f", "mdoc",
      "--section", "#{mandb_section(gem)}",
      "-o", "#{output_directory}",
      gem.full_gem_path,
    ]
  end

  def output_directory
    File.join(Dir.home, ".man")
  end

  def mandb_section(gem)
    "3-rubygems-#{gem.name}-#{gem.version.to_s.gsub(".", "-")}"
  end
end
