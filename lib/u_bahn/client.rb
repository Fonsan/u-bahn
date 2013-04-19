require 'forwardable'
module UBahn
  class Client
    extend Forwardable

    attr_reader :client

    def initialize(client)
      @client = client
    end

    delegate :list_queues_async => :client

    def list_queues(prefix = nil, &block)
      prefix_request = UBahn::CreateQueueRequest.new(*[prefix])
      if block
        list_queues_async(prefix_request, &block)
      else
        @client.list_queues(prefix_request).to_a
      end
    end
  end
end