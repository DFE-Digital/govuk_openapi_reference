require "rack/file"
require "capybara/rspec"

Capybara.app = Rack::File.new("tmp/test-build")

RSpec.describe "OpenAPI reference" do
  include Capybara::DSL

  it "generates the api reference" do
    when_the_site_is_created
    when_i_view_an_api_reference_page
    then_there_is_correct_api_path_content
    then_there_is_correct_api_schema_content
  end

  def when_the_site_is_created
    rebuild_site!
  end

  def when_i_view_an_api_reference_page
    visit "/index.html"
  end

  def then_there_is_correct_api_path_content
    # Path title
    expect(page).to have_css("h3", text: "GET /pets")
  end

  def then_there_is_correct_api_schema_content
    expect(page).to have_css("h3", text: "The Pet object")
  end

  def rebuild_site!
    html = GovukOpenapiReference::HTML.new(File.read("spec/examples/pets.yml")).generate_html

    Dir.mkdir("tmp") rescue nil
    Dir.mkdir("tmp/test-build") rescue nil
    File.write("tmp/test-build/index.html", html)
  end
end
