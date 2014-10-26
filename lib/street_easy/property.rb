require 'open-uri'
require 'json'

module StreetEasy
  class Property < Client
    @property_type = 'rentals'
    @options = [
      :title,
      :area_name,
      :price,
      :bedrooms,
      :bathrooms,
      :size_sqft,
      :url
    ]

    OPTIONS = [
      :title,
      :area_name,
      :price,
      :bedrooms,
      :bathrooms,
      :size_sqft,
      :url,
      :medium_image_uri,
      :source_label,
      :clean_address,
      :description,
      :half_baths,
      :rooms_description,
      :addr_street,
      :addr_unit,
      :normalized_addr_unit,
      :addr_city,
      :addr_lat,
      :addr_lon,
      :size_sqft_num,
      :lot_size,
      :size_description,
      :ppsf,
      :ppsf_num,
      :ppsf_description,
      :created_at,
      :unit_type,
      :unit_type_label,
      :status,
      :price_cur,
      :floorplan,
      :open_house_start,
      :open_house_end,
      :sourceid
    ]
    
    class << self
      def neighborhoods(*neighborhood)
        @neighborhoods = neighborhood.join(',') if neighborhood.kind_of?(Array)
        @neighborhoods = neighborhood           if neighborhood.kind_of?(String)
        self
      end

      def rentals
        @property_type = 'rentals'
        self
      end

      def sales
        @property_type = 'sales'
        self
      end

      def options(*options)
        @options = options.kind_of?(Array) ? options.flatten : options
        self
      end

      def order(sort_type)
        case sort_type
          when :most_expensive  then @sort_type = "price_desc"
          when :least_expensive then @sort_type = "price_asc"
          when :newest          then @sort_type = "listed_desc"
        end
        self
      end

      def limit(limit)
        @limit = limit
        generate_properties
      end

      def all
        @limit = 200 # the api limit
        generate_properties
      end


      private
      def generate_properties
        parsed_reply = get_parsed_reply
        properties = []

        (0..@limit - 1).each do |i|
          break if parsed_reply['listings'][i] == nil
          rental = {}

          OPTIONS.each do |option|
            rental[option] = parsed_reply['listings'][i][option.to_s] if @options.include?(option)
          end

          properties << rental
        end

        properties
      end

      def get_parsed_reply
        uri = StreetEasy::Client.construct_url({
          property_type: @property_type,
          neighborhoods: @neighborhoods,
          limit: @limit,
          order: @sort_type
        })

        reply = uri.read
        parsed_reply = JSON.parse(reply)
      end
    end
  end
end