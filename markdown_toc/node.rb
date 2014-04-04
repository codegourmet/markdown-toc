module MarkdownToc
  class Node
    def initialize(parent, content)
      @parent = parent
      @content = content
      @children = []
    end

    def add_child(content)
      child = Node.new(self, content)
      @children << child
      child
    end

    def ancestors
      return [] if @parent.nil?
      @parent.ancestors + [@parent]
    end

    def siblings
      @parent.nil? ? [] : @parent.children
    end

    def children
      @children
    end

    def parent
      @parent
    end

    def siblings_index
      return 0 if @parent.nil?
      @parent.children.index(self)
    end

    def get_index_path
      nodes = (ancestors + [self]).compact
      nodes.map(&:siblings_index)
    end

    def depth
      ancestors.count
    end

    def content
      @content
    end

    def get_flat_child_list
      [self] + @children.collect(&:get_flat_child_list).flatten
    end
  end
end
