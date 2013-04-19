require_relative '../lib/u_bahn.rb'

transport_system = UBahn.transport_system("http://0.0.0.0:9324/")

p transport_system.list_queues.get_queue_urls.to_a