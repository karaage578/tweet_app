
class IftttSidekiqJob < ApplicationJob
  queue_as :default

  def self.perform
    require "net/http"
    require "json"
    require "uri"

    uri = URI.parse("http://maker.ifttt.com/trigger/test/with/key/bJQ3IaL-4wS7zs87PQ4J0N/")
    http = Net::HTTP.post(uri, {
        "value1": "a",
        "value2": "b",
        "value3": "http://localhost:3000/posts/index"
    }.to_json, "Content-Type" => "application/json")
  end
  perform
end
