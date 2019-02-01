module OAuth2
  class AccessToken
    def get(url, path, opts = {}, &block)
      client.connection.url_prefix = url
      request(:get, path, opts, &block)
    end
  end
end
