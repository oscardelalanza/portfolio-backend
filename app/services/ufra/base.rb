class Ufra::Base < ApplicationService
  BASE_URL = ENV.fetch('UFRA_BASE_URL') { 'https://ufra.com.mx' }

  def connector(path)
    Faraday.get(url(path))
  end

  private

  def url(path)
    URI.join(BASE_URL, path)
  end
end
