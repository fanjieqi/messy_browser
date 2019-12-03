require_relative 'head'
require_relative 'body'
require_relative 'foot'

module Ui
  class Tab < FXTabItem
    attr_reader :history, :index
    ADD = '+'.freeze

    def initialize(tabbook, app, name = nil)
      super(tabbook, name || ADD)

      frame = FXVerticalFrame.new(tabbook, LAYOUT_FIX_WIDTH | LAYOUT_FILL_Y, height: 500)

      @head = ::Ui::Head.new(frame, app)
      @body = ::Ui::Body.new(frame)
      @foot = ::Ui::Foot.new(frame)

      @history = []
      @index = -1
    end

    def to(url)
      @history = @history[0..@index - 1] if index.positive?
      @history << url
      @index += 1
      visit(url)
    end

    def back
      return unless @index.positive?

      @index -= 1
      visit(@history[@index])
    end

    def forward
      return unless @index.positive? && (@index < @history.size - 1)

      @index += 1
      visit(@history[@index])
    end

    def visit(url)
      options = { method: :get, url: url }
      ::Network::Pool.push(self, options)
    end

    def process(result)
      p result.body
    end
  end
end
