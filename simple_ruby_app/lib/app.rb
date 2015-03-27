require 'net/http'

# NOTE:
#   Big apps split their components across several files for maintanability.
#   You should create such files in 'app/' folder. They can then be required
#   here.
require 'app/componentA'

class App
  # NOTE:
  #   Methods that should be called as 'App.function_name', or class methods
  #   should be defined here.
  class << self
    # Returns version number from 'gemspec' file.
    def version
      gemspec_file = File.join(File.dirname(__FILE__), '..', 'app.gemspec')
      gemspec = eval File.read gemspec_file
      gemspec.version
    end
  end

  # This function will be called when 'App' is initialized.
  def initialize(files, options = {})
    @files = files
    @options = options
  end

  # Attributes.
  attr_reader :files, :options

  # Instance methods.

  def run
    out = File.open(options[:out], 'w') if options[:out]
    out = STDOUT unless out

    ids = File.readlines files[0]
    ids.map!(&:chomp)
    ids.each do |id|
      uri = URI "http://www.uniprot.org/uniprot/#{id}.fasta"
      res = Net::HTTP.get_response uri
      if res.code != '200'
        STDERR.puts "#{id} not found"
        next
      end
      out.puts res.body
    end
    out.close
  end
end
