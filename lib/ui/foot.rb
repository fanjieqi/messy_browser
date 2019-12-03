require_relative 'foot/info_bar'

module Ui
  class Foot < FXMenuBar
    def initialize(contents)
      super(contents, LAYOUT_SIDE_BOTTOM, width: 1200, height: 10)

      @info_bar = ::Ui::InfoBar.new(self)
    end
  end
end
