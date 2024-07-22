require "spec"
require "./app"

describe "N Queens Solver" do
  describe "#dfs" do
    it "finds all solutions for 4 queens" do
      result = [] of Array(Int32)
      dfs(result, [] of Int32, [] of Int32, [] of Int32, 4)
      result.size.should eq 2
    end
  end

  describe "#solve_n_queens" do
    it "returns correct board configurations for 4 queens" do
      solutions = solve_n_queens(4)
      solutions.size.should eq 2
      solutions.each do |solution|
        solution.size.should eq 4
        solution.each do |row|
          row.size.should eq 4
          row.count("Q").should eq 1
        end
      end
    end
  end
end
