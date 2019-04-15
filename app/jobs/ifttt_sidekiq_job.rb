class IftttSidekiqJob < ApplicationJob
  queue_as :default

  def perform
    require "net/http"
    require "json"
    require "uri"

    @post = Post.where(delivery_void_flag: "effective").offset( rand(Post.count) ).first

    uri = URI.parse("http://maker.ifttt.com/trigger/test/with/key/bJQ3IaL-4wS7zs87PQ4J0N/")
    http = Net::HTTP.post(uri, {
        "value2": @post.content,
        "value3": @post.url
    }.to_json, "Content-Type" => "application/json")
  end
end
