# NOTE:
#   Big apps split their components across several files for maintanability.
#   You should create such files in 'app/' folder. They can then be required
#   here.
require 'app/componentA'

# TODO:
#   1. Rename App to the name of your app in camelcase - like SequenceServer.
#   2. Document what it does.
class App

  # NOTE:
  #   Methods that should be called as 'App.function_name', or class methods
  #   should be defined here.
  class << self

    # Return version number from 'gemspec' file.
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
    puts "Will run analysis on: #{files} with the following options: #{options}"
  end
end
