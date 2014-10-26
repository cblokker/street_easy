module StreetEasy
  class Client
    BASE_URI = "http://www.streeteasy.com/nyc/api/"

    def self.api_key
      @api_key
    end

    def self.api_key=(key)
      @api_key = key
    end

    def self.construct_url(query)
      uri = URI(
        "#{BASE_URI}" +
        "#{query[:property_type]}/" +
        "search?criteria=" +
          "area=#{query[:neighborhoods]}&" +
          "limit=#{query[:limit]}&" +
          "order=#{query[:order]}&" +
          "key=#{@api_key}&" +
          "format=json"
      )
    end
  end
end