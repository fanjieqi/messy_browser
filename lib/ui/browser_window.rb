require_relative 'tab'

module Ui
  class BrowserWindow < FXMainWindow
    attr_reader :tabs

    def initialize(app)
      # Call base class initializer first
      super(app, 'MessyBrowser', nil, nil, DECOR_ALL, 0, 0, 1280, 720)
      @app = app
      @tabs = []

      @contents = FXHorizontalFrame.new(self, LAYOUT_FILL_X | LAYOUT_FILL_Y, 0, 0, 1280, 300)
      @tabbook = FXTabBook.new(@contents, nil, 0, LAYOUT_FILL_X | LAYOUT_FILL_Y | LAYOUT_RIGHT, height: 1000)

      add_tab
    end

    # Create and show the main window
    def create
      super
      show(PLACEMENT_SCREEN)
    end

    def add_tab
      @tabs << ::Ui::Tab.new(@tabbook, @app, 'New Tab')
      @tabs << ::Ui::Tab.new(@tabbook, @app)
    end
  end
end
