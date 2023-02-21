class Ufra::Base < ApplicationService
  BASE_URL = fetch.env('UFRA_BASE_URL')

  def connector(path)
    Faraday.get(url(path))
  end

  private

  def url(path)
    URI.join(BASE_URL, path)
  end
end
