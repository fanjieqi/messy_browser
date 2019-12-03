module Ui
  class InfoBar < FXTextField
    def initialize(contents)
      super(contents, 250)
      self.text = 'status: '
      self.editable = false
    end

    def process(info)
      self.text = info
    end
  end
end
