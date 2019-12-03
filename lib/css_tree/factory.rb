require_relative 'tag/div'

module CssTree
  class Factory
    include Singleton

    PRODUCT = {
      div: ::CssTree::Tag::Div
    }.freeze

    def get_instance(name)
      (PRODUCT[name] || ::CssTree::Tag::Div).new
    end
  end
end
