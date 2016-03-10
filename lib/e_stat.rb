require 'e_stat/version'
require 'e_stat/api'

module EStat
  # Your code goes here...



  def self.find(stats_code)
    base_url = 'http://api.e-stat.go.jp/rest/2.0/app/json/'
    key = '5b2d9330be6bc9f0dd64515af255b3b0b2b90be0'

    p url = "#{base_url}getStatsList?appId=#{key}&statsCode=#{stats_code}"

    response = Faraday.get(url)
    attributes = JSON.parse(response.body)
  end
end
