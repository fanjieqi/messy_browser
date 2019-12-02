require_relative 'tag/div'

module DomTree
  class Factory
    include Singleton

    PRODUCT = {
      div: ::DomTree::Tag::Div
    }

    def get_instance(name)
      (PRODUCT[name] || ::DomTree::Tag::Div).new
    end
  end
end
