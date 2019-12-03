module Ui
  class Body < ShapeCanvas
    def initialize(contents)
      super(contents, nil, 0, LAYOUT_FILL_X | LAYOUT_FILL_Y, 0, 0, 1280, 700)
      self.scene = build_scene
    end

    private

    def build_scene
      scene = ShapeGroup.new
      scene
    end
  end
end
