module GovukOpenapiReference
  class HTML
    attr_reader :api_reference
    delegate :operations, :schemas, to: :api_reference

    def initialize(openapi_spec)
      @api_reference = GovukOpenapiReference::APIReference.new(openapi_spec)
    end

    def generate_html
      # TODO: this only works in Rails. In tech docs we have to strip the
      # whitespace at the start of each line, to not confuse the markdown renderer.
      render("index", api_reference: api_reference).html_safe
    end

    def link_to(name, url, options = {})
      "<a href='#{url}' class='govuk-link #{options[:class]}'>#{name}</a>"
    end

    def render(partial, locals)
      ERB.new(File.read("#{__dir__}/templates/_#{partial}.html.erb")).result(binding)
    end

    def json_code_sample(code)
      source = JSON.pretty_generate(code)
      formatter = Rouge::Formatters::HTML.new
      lexer = Rouge::Lexers::JSON.new

      render "code_sample", source: formatter.format(lexer.lex(source))
    end

    def markdown_to_html(markdown)
      MarkdownRenderer.render(markdown.to_s).html_safe
    end
  end
end
