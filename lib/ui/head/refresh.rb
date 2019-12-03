module Ui
  class Refresh < FXButton
    def initialize(contents, app)
      # Construct icon from a PNG file on disk
      button_image = load_icon('refresh_button.png', app)

      # The button
      super(contents,
        nil,
        button_image,
        opts: FRAME_RAISED | FRAME_THICK | LAYOUT_CENTER_X | LAYOUT_CENTER_Y | LAYOUT_FIX_WIDTH | LAYOUT_FIX_HEIGHT,
        width: 40, height: 40)
    end

    private

    # Load the named icon from a file
    def load_icon(filename, app)
      filename = File.expand_path("../../../../icons/#{filename}", __FILE__)
      File.open(filename, 'rb') do |f|
        FXPNGIcon.new(app, f.read)
      end
    end
  end
end
