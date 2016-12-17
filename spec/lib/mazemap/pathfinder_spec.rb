require "spec_helper"

describe Mazemap::Pathfinder do
  describe "#initialize" do
    let!(:pathfinder) { described_class.new(file_fixture("maze.txt")) }

    it "sets rows and cols" do
      expect(pathfinder.rows).to be > 0
      expect(pathfinder.cols).to be > 0
    end

    it "sets lines" do
      expect(pathfinder.lines.size).to be > 0
    end
  end

  describe "#solution" do

    context "correct maze" do
      it "outputs a solution" do
        pathfinder = described_class.new(file_fixture("maze.txt"))
        solution = pathfinder.solution
        expect(solution).to be_an_instance_of(Array)
        expect(solution.size).to be > 0
      end

      it "outputs an empty solution" do
        pathfinder = described_class.new(file_fixture("empty_path_maze.txt"))
        solution = pathfinder.solution
        expect(solution).to be_an_instance_of(Array)
        expect(solution.size).to be_zero
      end
    end

    context "wrong maze" do
      it "raises an error" do
        pathfinder = described_class.new(file_fixture("wrong_maze.txt"))
        expect{pathfinder.solution}.to raise_error(TypeError)
      end
    end

  end
end
