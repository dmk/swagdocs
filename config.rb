require 'lib/open_api'

set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks:  true,
               smartypants:         true,
               tables:              true,
               space_after_headers: true

configure :build do
  activate :asset_hash
  activate :gzip
  activate :minify_css
  activate :minify_javascript
end

Middleman::Extensions.register :open_api, OpenAPI
activate :open_api, url: 'https://api.development.etorox.io/api/v2/swagger.json'
