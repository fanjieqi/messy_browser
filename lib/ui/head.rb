require_relative 'head/back'
require_relative 'head/forward'
require_relative 'head/address_bar'

module Ui
  class Head < FXMatrix
    def initialize(contents, app)
      super(contents, 3, MATRIX_BY_COLUMNS | LAYOUT_SIDE_TOP)

      @back_button = ::Ui::Back.new(self, app)
      @forward_button = ::Ui::Forward.new(self, app)
      @address_bar = ::Ui::AddressBar.new(self)
    end
  end
end
