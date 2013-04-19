require 'spec/spec_helper'

module UBahn
  describe UBahn::Client do
    let(:aws_client) {double("AWSClient")}
    subject {
      described_class.new aws_client
    }

    let(:example_queues) { ['http://server/queue'] }

    def array_result(arr)
      res = double('AWSArrayResult')
      res.stub!(:to_a) { arr }
      res
    end

    def future(res)
      future = double('AWSFuture')
      future.stub!(:get) { res }
      future
    end

    describe 'list_queues' do
      it 'lists queues' do
        aws_client.stub!(:list_queues) { array_result(example_queues) }
        subject.list_queues.should == example_queues
      end

      it 'filtered by prefix' do
        aws_client.should_receive(:list_queues).with(UBahn::CreateQueueRequest.new('prefix'))
        subject.list_queues("prefix")
      end

      it 'does async block' do
        aws_client.should_receive(:list_queues_async).with(UBahn::CreateQueueRequest.new)
        subject.list_queues do |queues|
          queues.should == example_queues
        end
      end

      it 'does async future' do
        pending
        aws_client.should_receive(:list_queues_async).with()
        subject.list_queues_async do |queues|
          queues.should == example_queues
        end
      end
    end
  end
end