require "govuk_openapi_reference"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  # This only works in test
end

require "bundler/gem_tasks"
task default: :spec

task :generate_test_pages do
  %w[pets.yml apply.yml].each do |filename|
    html = GovukOpenapiReference::HTML.new(File.read("spec/examples/#{filename}")).generate_html

    Dir.mkdir("tmp") rescue nil
    Dir.mkdir("tmp/test-build") rescue nil
    File.write("tmp/test-build/#{filename}.html", ERB.new(File.read("spec/example_layout.html.erb")).result(binding))
    sh "open tmp/test-build/#{filename}.html"
  end
end
