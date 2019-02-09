class IftttJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts 'テスト'
  end
end
