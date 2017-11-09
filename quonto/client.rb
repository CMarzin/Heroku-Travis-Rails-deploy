require 'rest-client'

class Client

  attr_reader :slug, :secret, :url

  def initialize(slug, secret)
    @slug = slug
    @secret = secret
    @url = "https://thirdparty.qonto.eu/v1"
  end

  def organizations
    res = RestClient.get(
      url + "/organizations/#{slug}", 
    { 'Authorization' => "#{slug}:#{secret}"}
    )
    puts res
    status = res.code
    puts res.code
    puts res.body if status.to_i == 200
  end
end

Client.new("qonto-test-9312", "c1f097108df2").organizations