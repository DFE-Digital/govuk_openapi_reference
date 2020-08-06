# GOV.UK OpenAPI Reference (for Ruby)

This gem allows you to convert an OpenAPI spec into GOV.UK-flavoured HTML.

🚨 This is highly experimental, don't use it in production yet (unless you're in Apply).

## Background

This is a rewrite of the Tech docs gem's OpenAPI renderer, extracted from [Apply for teacher training](https://github.com/DFE-Digital/apply-for-teacher-training).

Currently it works in Rails, but the intention is to make it a drop-in replacement for the API reference in the [GOV.UK Tech Docs template](https://github.com/alphagov/tech-docs-template) as well.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'govuk_openapi_reference', github: 'DFE-Digital/govuk_openapi_reference'
```

## Usage

Add this to your view:

```erb
<%= GovukOpenapiReference::HTML.new(File.read('path/to/your/openapi-spec.yml')).generate_html %>
```

This works in Rails. This doesn't yet include the stylesheets, so the code blocks still look a bit funky.

## Development

You can run `rake generate_test_pages` to generate example outputs.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/DFE-Digital/govuk_openapi_reference.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
