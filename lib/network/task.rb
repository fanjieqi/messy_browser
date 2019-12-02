

module Network
  class Task
    TIMEOUT = 60
    SLEEP = 'sleep'
    attr_reader :pool, :queue

    def initialize(pool)
      @pool = pool
      @queue = Queue.new
    end

    def push(object, params = {})
      @queue << [object, params]
    end

    def run
      Thread.new {
        loop do
          object, params = @queue.pop
          next if object.blank? || params.blank?

          begin
            puts "#{Thread.current} is Working"
            result = RestClient::Request.execute(params.merge(timeout: TIMEOUT))
            object.process(result)
          rescue => e
            warn e.full_message
          ensure
            Thread.pass
          end
        end
      }
    end
  end
end
