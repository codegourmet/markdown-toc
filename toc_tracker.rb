# tracks the depth/nesting state for parsing
# and for creating the toc structure
#

require File.join(File.dirname(__FILE__), 'toc_node.rb')

class TocTracker
  def initialize
    @root = TocNode.new(nil, "root")
    @current_node = @root
  end

  # adds a node.
  # will ascend or descend in the tree,
  # depending on the new node's desired depth
  def add_node(depth, title)
    while depth <= @current_node.depth
      # ascend back out of the tree
      @current_node = @current_node.parent
    end

    new_node = @current_node.add_child(title)

    if depth > @current_node.depth
      # descend into node
      @current_node = new_node
    end

    if depth > @current_node.depth
      raise RuntimeError.new("subtitle deeper than parent: " + title)
    end

    new_node
  end

  def get_flat_node_list
    @root.get_flat_child_list
  end
end
