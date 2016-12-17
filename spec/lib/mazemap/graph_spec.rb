require "spec_helper"

describe Mazemap::Graph do
  let!(:rows) { 2 }
  let!(:cols) { 2 }

  let!(:graph_map) do
    Array.new(rows*cols).fill(described_class::BLANK)
  end

  let!(:graph) do
    described_class.new(rows, cols, graph_map)
  end

  describe "#initialize" do
    it "sets rows and cols" do
      expect(graph.rows).to eq rows
      expect(graph.cols).to eq cols
    end

    it "sets graph and queue" do
      expect(graph.graph).to be_an_instance_of(NMatrix)
      expect(graph.queue).to be_an_instance_of(Queue)
    end
  end

  describe "#shortest_path" do
    context "correct maze" do
      it "outputs a path" do
        path = graph.shortest_path([0, 0], [rows - 1, cols - 1])
        expect(path).to be_an_instance_of(Array)
        expect(path.size).to be > 0
      end

      it "outputs an empty path" do
        no_path_graph_map = Array.new(rows*cols).fill(described_class::INF)
        no_path_graph_map[0] = described_class::BLANK
        no_path_graph_map[-1] = described_class::BLANK
        no_path_graph = described_class.new(rows, cols, no_path_graph_map)
        path = no_path_graph.shortest_path([0, 0], [rows - 1, cols - 1])
        expect(path).to be_an_instance_of(Array)
        expect(path.size).to be_zero
      end
    end
  end
end
