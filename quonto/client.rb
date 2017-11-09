require 'rest-client'
require 'json'

class Client
  URL =' https://thirdparty.qonto.eu/v1'
  attr_reader :slug, :secret, :url

  def initialize(slug, secret)
    @slug = slug
    @secret = secret
  end

  def self.url
    URL
  end

  def organizations
    # || begin => sauvegarde en mémoire
    res = RestClient.get(
      URL + "/organization/#{slug}", 
    { 'Authorization' => "#{slug}:#{secret}"}
    )
    status = res.code
    return "Erreur : #{status}" if status.to_i != 200    
    JSON.parse(res.body) if status.to_i == 200
  end

  def find_iban_and_slug
    res = organizations
    {
      slug: res['organization']['bank_accounts'][0]['slug'],
      iban: res['organization']['bank_accounts'][0]['iban']
    }
  end

  def iban
    find_iban_and_slug[:iban]
  end

  def bank_account_slug
   find_iban_and_slug[:slug]
  end

  def transactions(iban)
    res = RestClient::Request.execute(
      method: :get,
      url: URL + "/transactions?slug=#{bank_account_slug}&#{iban}",
      headers: { 'Authorization' => "#{slug}:#{secret}"}
    )
    status = res.code
    return "Erreur : #{status}" if status.to_i != 200    
    JSON.parse(res.body)
  end
end

client = Client.new("qonto-test-9312", "c1f097108df2")
iban = client.iban
transactions = client.transactions(iban)