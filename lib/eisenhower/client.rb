module Eisenhower
  class Client
    attr_accessor :oauth_token
    
    include HTTParty
    base_uri "https://api.interstateapp.com/v#{API_VERSION}"
    format :json
        
    def self.fetch(path, options={})
      options.merge!({:default_params => {:oauth_token=> Eisenhower.oauth_token}})
      get(path, options)
    end
    
    def self.get_and_parse(path, options={})
      getter = fetch(path, options)
      return Crack::JSON.parse(getter.body)["response"] 
    end    
    
    
    
  end
end