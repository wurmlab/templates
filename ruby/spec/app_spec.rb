require 'minitest/spec'
require 'app'

describe 'App' do
  def input_file
    File.expand_path('uniprot_ids.txt', __dir__)
  end

  def output_file
    File.expand_path('uniprot_out.txt', __dir__)
  end

  it 'should download correct number of FASTA' do
    app = App.new([input_file], {:out => output_file})
    app.run

    `grep '>' out | wc -l`.chomp.to_i.must_equal 4

    File.unlink output_file
  end
end
