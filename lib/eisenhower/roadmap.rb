module Eisenhower
  class Roadmap
    attr_accessor :id, :app_id, :archived, :public, :title, :time, :staff_ids
    alias :name :title
    BOOLEANS = %w(archived public)
    
    def initialize(attributes={})
      attributes.each { |key, val| send("#{key}=", val) if respond_to?("#{key}=") }
    end

    BOOLEANS.each do |boolean|
      define_method("#{boolean}?") do
        self.instance_variable_get("@#{boolean}")
      end
    end
    
    def staff
      self.staff_ids.collect{|id| Eisenhower::Staff.find(id) }
    end
    
    def roads
      response = Eisenhower::Client.fetch("/roadmap/roads/id/#{self.id}")
      body = Crack::JSON.parse(response.body)["response"]
      body.collect{|road| Eisenhower::Road.new({
        :id               => road["_id"], 
        :title            => road["title"], 
        :description      => road["description"], 
        :description_html => road["descriptionHtml"], 
        :collapsed        => road["collapsed"], 
        :status           => road["status"]["status"], 
        :due              => road["due"] ? road["due"]["dmy"] : false,
        :started          => road["start"] ? road["start"]["dmy"] : false,
        :position         => road["order"]["position"], 
        :updates_count    => road["updatesCount"],
        :update_ids       => road["updates"].collect{|up| up["_id"]},
        :staff_ids        => road["staffList"]
      })}
    end
    
    class << self
        def all
          return body = Eisenhower::Client.get_and_parse('/roadmap/listAll')
          #body.collect{|roadmap| Eisenhower::Roadmap.new({
          #  :id        => roadmap.last.last["_id"], 
          #  :app_id    => roadmap.last.last["appId"], 
          #  :archived  => roadmap.last.last["archived"],
          #  :public    => roadmap.last.last["public"],
          #  :title     => roadmap.last.last["title"],
          #  :time      => roadmap.last.last["time"],
          #  :staff_ids => roadmap.last.last["staff"].collect{|staff| staff["_id"]}
          #  }
          #)}
        end
        
        def find(app_id)
          body = Eisenhower::Client.get_and_parse("/roadmap/get/id/#{app_id}")
          Eisenhower::Roadmap.new({
            :id        => body["_id"], 
            :app_id    => body["appId"], 
            :archived  => body["archived"],
            :public    => body["public"],
            :title     => body["title"],
            :staff_ids => body["staff"].collect{|staff| staff["_id"]}
          })
        end
    end
  end
end