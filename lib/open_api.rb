require 'middleman-core'

# disable hashie warnings
class Response < Hashie::Mash
  disable_warnings
end

# Middleman OpenAPI helpers
class OpenAPI < ::Middleman::Extension
  option :url, nil, 'URL to OpenAPI/Swagger spec'

  expose_to_template :info

  def initialize(app, options_hash = {}, &block)
    super

    require 'net/http'

    @spec = fetch_spec(options.url)
  end

  def info
    @spec.info
  end

  private

  def fetch_spec(url)
    Hashie::Mash.new(JSON.parse(Net::HTTP.get(URI(url))))
  end
end
