module DomTree
  module Tag
    class Div
      def process(result)
        puts "Tag #{self} get result: #{result.code}"
      end
    end
  end
end
