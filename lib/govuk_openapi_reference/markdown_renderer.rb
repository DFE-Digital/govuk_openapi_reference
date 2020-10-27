module GovukOpenapiReference
  class MarkdownRenderer < ::Redcarpet::Render::HTML
    def paragraph(text)
      <<~HTML
        <p class='govuk-body'>
          #{text}
        </p>
      HTML
    end

    def table(header, body)
      <<~HTML
        <table class='govuk-table'>
          <thead class='govuk-table__head'>
            #{header}
          </thead>
          <tbody class='govuk-table__body'>
            #{body}
          </tbody>
        </table>
      HTML
    end

    def table_row(content)
      <<~HTML
        <tr class='govuk-table__row'>
          #{content}
        </tr>
      HTML
    end

    def table_cell(content, _alignment)
      <<~HTML
        <td class='govuk-table__cell'>
          #{content}
        </td>
      HTML
    end

    def link(link, title, content)
      title_attribute = title.present? ? " title=\"#{title}\"" : ''
      %(<a href="#{link}" class="govuk-link"#{title_attribute}>#{content}</a>)
    end

    def self.render(content)
      Redcarpet::Markdown.new(self, tables: true, no_intra_emphasis: true).render(content)
    end
  end
end
