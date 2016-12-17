module Mazemap
  # Graph object class
  # 
  # @author Evgenii Shevchenko
  # @!attribute [r] graph
  #   @return [NMatrix] graph map matrix
  # @!attribute [r] queue
  #   @return [Queue] progress queue
  # @!attribute [r] rows
  #   @return [Integer] number of the rows
  # @!attribute [r] cols
  #   @return [Integer] number of the cols
  class Graph
    attr_reader :graph
    attr_reader :queue
    attr_reader :rows
    attr_reader :cols
  
    INF = Float::INFINITY
    BLANK = -Float::INFINITY
    VISITED = Float::MAX
    START = 1
    FINISH = 2
  
    # Initializes Graph object, sets rows and cols, graph map
    #
    # @param n [Integer] number of rows
    # @param m [Integer] number of columns
    # @param graph_map [Array] prepared vector of the graph map
    def initialize(n, m, graph_map)
      @rows, @cols = n, m
      @graph = NMatrix.new([n, m], graph_map)
      @queue = Queue.new
    end
  
    # Starts a search for the shortest path
    #
    # @param start [Array] start vertex coords
    # @param finish [Array] finish vertex coords
    def shortest_path(start, finish)
      queue << [start, 0]
      loop do
        break if queue.empty?
        vertex, d = queue.pop
        graph[*vertex] = d
        break if vertex == finish
        enqueue_neighbours(*vertex, d + 1)
      end
      queue.clear
      !blank?(finish) ? build_path(start, finish) : []
    end
  
    private
  
    # Checks if vertex is blank
    #
    # @param vertex [Array] vertex coords
    def blank?(vertex)
      graph[*vertex] == BLANK
    end
  
    # Builds the shortest path from the processed graph
    #
    # @param start [Array] start vertex coords
    # @param finish [Array] finish vertex coords
    def build_path(start, finish)
      path = [finish]
      loop do
        vertex = path.last
        d = graph[*vertex]
        neighbours = get_neighbours(*vertex)
        next_vertex = neighbours.select{|n_vert| graph[*n_vert] == d - 1}.first
        path << next_vertex if next_vertex
        break if vertex == start
      end
      path
    end
  
    # Collects the neighbours of the given vertex
    #
    # @param n [Integer] row number of vertex
    # @param m [Integer] column number of vertex
    def get_neighbours(n, m)
      [[n - 1, m],[n + 1, m],[n, m - 1],[n, m + 1]].select do |coords| 
        coords.first.between?(0, rows - 1) && coords.last.between?(0, cols - 1)
      end
    end
  
    # Adds the neighbours of the given vertex to the queue and marks them
    #
    # @param n [Integer] row number of vertex
    # @param m [Integer] column number of vertex
    # @param d [Integer] distance mark of vertex
    def enqueue_neighbours(n, m, d)
      get_neighbours(n, m).each do |vertex|
        if blank?(vertex)
          graph[*vertex] = VISITED
          queue << [vertex, d] 
        end
      end
    end
  
  end
end