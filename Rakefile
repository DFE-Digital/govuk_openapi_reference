require "govuk_openapi_reference"

begin
  require "rspec/core/rake_task"
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
  # This only works in test
end

require "bundler/gem_tasks"
task default: :spec

desc "Generate HTMl for the examples API specs in spec/examples"
task :generate_test_pages do
  Dir.mkdir("tmp") rescue nil
  Dir.mkdir("tmp/test-build") rescue nil

  sh "cp assets/govuk-frontend-3.9.1.min.css tmp/test-build/govuk-frontend-3.9.1.min.css"

  %w[pets.yml apply.yml].each do |filename|
    html = GovukOpenapiReference::HTML.new(File.read("spec/examples/#{filename}")).generate_html
    File.write("tmp/test-build/#{filename}.html", ERB.new(File.read("spec/example_layout.html.erb")).result(binding))
    sh "open tmp/test-build/#{filename}.html"
  end
end

desc "Compile the CSS needed to render the API reference"
task :compile_assets do
  require "sassc"
  css = SassC::Engine.new(File.read("assets/styles.scss"), style: :compressed).render
  File.write("assets/compiled-styles.css", css)
end
