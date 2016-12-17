module Mazemap
  # Pathfinder object class
  # 
  # @author Evgenii Shevchenko
  # @!attribute [r] lines
  #   @return [Array] maze representation
  # @!attribute [r] rows
  #   @return [Integer] number of the rows
  # @!attribute [r] cols
  #   @return [Integer] number of the cols
  # @!attribute [r] start
  #   @return [Integer] start vertex coords
  # @!attribute [r] finish
  #   @return [Integer] finish vertex coords
  class Pathfinder
    attr_reader :lines
    attr_reader :rows
    attr_reader :cols
    attr_reader :start
    attr_reader :finish
  
    VERTEX_VALUES = {
    	' ' => Graph::BLANK,
    	'*' => Graph::INF,
    	'A' => Graph::START,
    	'B' => Graph::FINISH
    }
  
    # Initializes Pathfinder, sets @lines, @rows and @cols
    #
    # @param filename [String] path to file with maze
    def initialize(filename)
      if filename
        @lines = IO.readlines(filename).map(&:chomp)
        @rows = lines.length
        @cols = lines.first.length
      end
    end
  
    # Starts a search for the shortest path
    def solution
      graph_map = parse_graph_map.flatten
      set_route(graph_map)
      graph = Graph.new(rows, cols, graph_map)
      graph.shortest_path(start, finish).map(&:reverse).reverse
    end
  
    private
  
    # Sets start and finish vertex coords
    #
    # @param graph_map [Array] flatterned graph map
    def set_route(graph_map)
      start_element = graph_map.index(Graph::START)
      finish_element = graph_map.index(Graph::FINISH)
      graph_map[start_element] = Graph::BLANK
      graph_map[finish_element] = Graph::BLANK
      @start = [start_element / cols, start_element % cols]
      @finish = [finish_element / cols, finish_element % cols]
    end
  
    # Converts letter according to maze format
    #
    # @param letter [String] letter to convert
    def convert_letter(letter)
      VERTEX_VALUES[letter] || letter
    end
  
    # Parses the maze map and converts it to the internal format
    def parse_graph_map
      lines.map do |line| 
        line.split('').map do |letter| 
        	convert_letter(letter)
        end
      end
    end
  end
end