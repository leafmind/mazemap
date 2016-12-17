require 'nmatrix'
require 'mazemap/graph'
require 'mazemap/pathfinder'
require 'mazemap/version'

# Tries to find the shortest path
# 
# @author Evgenii Shevchenko
# @since 0.0.1
module Mazemap
  # Search for a shortest paths
  #
  # @example Run search
  #   >> Mazemap.read_and_search(filename)
  #   => [[6, 11], [7, 11], [8, 11], [9, 11], [10, 11]]
  def read_and_search(filename)
    pathfinder = Pathfinder.new(filename)
    pathfinder.solution
  end

  module_function :read_and_search
end