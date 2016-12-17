require "spec_helper"

describe Mazemap do
  it "has a version number" do
    expect(Mazemap::VERSION).not_to be nil
  end

  it "outputs solution" do
  	solution = Mazemap.read_and_search(file_fixture("maze.txt"))
    expect(solution).to be_an_instance_of(Array)
  end
end
