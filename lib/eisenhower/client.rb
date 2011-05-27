module Eisenhower
  class Client
    attr_accessor :oauth_token
    include HTTParty
    base_uri "https://api.interstateapp.com/v#{API_VERSION}"
    default_params :oauth_token => "UBSB7ycFWRohc75Sd4jNEl6KIJgHl9GN"
    format :json
        
    def self.get_and_parse(path, options={})
          response = get(path, options)
          return Crack::JSON.parse(response.body)["response"]
    end    
    
  end
end