# get the jars into cp
Dir["ext/jar/*"].each(&method(:require))

module UBahn
  include_package "com.amazonaws.services.sqs"
  include_package "com.amazonaws.services.sqs.buffered"
  include_package "com.amazonaws.services.sqs.model"

  # import "com.amazonaws.services.sqs.model.SendMessageRequest"
  # import "com.amazonaws.ClientConfiguration"
  # import "com.amazonaws.services.sqs.AmazonSQSAsyncClient"
  # import "com.amazonaws.services.sqs.buffered.AmazonSQSBufferedAsyncClient"
  # import "com.amazonaws.auth.BasicAWSCredentials"
end

require 'u_bahn/client'

module UBahn
  def self.transport_system(end_point, options = {})
    async_client = AmazonSQSAsyncClient.new()
    async_client.set_endpoint(end_point)
    client = AmazonSQSBufferedAsyncClient.new(async_client)
  end
end