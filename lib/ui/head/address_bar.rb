module Ui
  class AddressBar < FXTextField
    def initialize(contents)
      super(contents, 250, height: 20)
      self.text = 'Ready...'
      self.editable = true
    end

    def process(address)
      self.text = address
    end
  end
end
