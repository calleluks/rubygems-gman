require "rubygems/command"
require "rdoc"
require "rdoc/generator/mdoc"

class Gem::Commands::GmanCommand < Gem::Command
  def initialize
    super "gman", "Generate and install man pages for gems"
  end

  def usage
    "gem gman [GEMNAME]"
  end

  def arguments
    "GEMNAME       name of gem to generate man pages for"
  end

  def execute
    if name = get_one_optional_argument
      document_gem_with_name name
    else
      document_all_gems
    end
  end

  def document(gem)
    inside_gem_directory gem do
      if files(gem).empty?
        say "No source files found for #{gem.full_name}."
      else
        say "Generating man pages for #{gem.full_name}..."
        run_rdoc(gem)
      end
    end
  rescue => exception
    say "Failed to generate man pages for #{gem.full_name} (#{exception})."
  end

  private

  def document_gem_with_name(name)
    document Gem::Specification.find_by_name(name)
  rescue Gem::LoadError
    say "Could not find a gem with the name \"#{name}\"."
  end

  def document_all_gems
    Gem::Specification.each { |gem| document gem }
  end

  def inside_gem_directory(gem, &block)
    Dir.chdir gem.full_gem_path, &block
  end

  def files(gem)
    (gem.source_paths + gem.extra_rdoc_files).select do |path|
      File.exists?(path)
    end
  end

  def run_rdoc(gem)
    RDoc::RDoc.new.document [
      "-q",
      "-f", "mdoc",
      "--section", "#{mandb_section(gem)}",
      "-o", "#{output_directory}",
      "--force-output",
      *files(gem),
    ]
  end

  def mandb_section(gem)
    "3-rubygems-#{gem.name}-#{gem.version.to_s}"
  end

  def output_directory
    File.join(Dir.home, ".man")
  end
end
