require "crest"

module Kahitsaan
  extend self

  API_URL       = "https://developers.zomato.com/api/v2.1"
  DEFAULT_COUNT = 20 # Based from Zomato API docs

  def get_location_details(area : String)
    begin
      response = Crest.get(
        "#{API_URL}/locations",
        headers: {"Accept" => "application/json", "user-key" => ENV["ZOMATO_API_KEY"]},
        params: {:query => area},
      )

      parsed = JSON.parse response.body
      suggestions = parsed["location_suggestions"]

      if suggestions.size > 0
        location = suggestions[0]

        return {success: true, message: "", data: {entity_id: location["entity_id"].as_i, entity_type: location["entity_type"].as_s}}
      end
    rescue ex : Crest::NotFound
      return {success: false, message: ex.response, data: nil}
    rescue ex : KeyError
      return {success: false, message: ex, data: nil}
    end

    return {success: false, message: "We cannot find #{area}", data: nil}
  end

  def get_restaurant(count : Number, entity_id : Number, entity_type : String)
    begin
      target_count = DEFAULT_COUNT < count ? count : DEFAULT_COUNT

      response = Crest.get(
        "#{API_URL}/search",
        headers: {"Accept" => "application/json", "user-key" => ENV["ZOMATO_API_KEY"]},
        params: {:entity_id => entity_id, :entity_type => entity_type, :count => target_count},
      )

      parsed = JSON.parse response.body

      if parsed["restaurants"].size > 0
        r = Random.new # @TODO: I thought that this would automatically prevent using the same index, but I noticed some entries can duplicate :|. Will debug.

        iter = (1..count).each.map do |_|
          index = r.rand(target_count)
          entry = parsed["restaurants"][index]
          entry["restaurant"]
        end

        return {success: true, message: "", data: iter.to_a}
      end
    rescue ex : Crest::NotFound
      return {success: false, message: ex.response, data: nil}
    rescue ex : KeyError
      return {success: false, message: ex, data: nil}
    end

    return {success: false, message: "No restaurants found", data: nil}
  end
end
