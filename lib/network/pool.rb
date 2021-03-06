require_relative 'task'

module Network
  class Pool
    TIMEOUT = 10
    attr_reader :queue, :concurrent_size, :tasks, :threads

    def initialize(params = {})
      @queue = Queue.new
      @concurrent_size = params[:concurrent_size]
      @tasks = @concurrent_size.times.map { ::Network::Task.new(self) }
      @threads = @tasks.map(&:run)
    end

    def push(object, params = {})
      @queue << [object, params]
    end

    def thread_index
      @threads.map.with_index { |thread, index| [thread.status, index] }
              .select { |status, _index| status == ::Network::Task::SLEEP }
              .sample.last
    end

    def run
      Thread.new do
        loop do
          next if @queue.empty?

          index = thread_index
          next if index.blank?

          tag, params = @queue.pop
          begin
            @tasks[index].push(tag, params)
          rescue StandardError => e
            warn e.full_message
            push(tag, params)
          end
        end
      end
    end
  end
end
