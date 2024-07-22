def dfs(valid_configs : Array(Array(Int32)), queens : Array(Int32), yx_diffs : Array(Int32), yx_sums : Array(Int32), n : Int32)
  row_idx = queens.size
 
  if row_idx == n
    valid_configs << queens
  else
    (0...n).each do |col_idx|
      unless queens.includes?(col_idx) || yx_diffs.includes?(row_idx - col_idx) || yx_sums.includes?(row_idx + col_idx)
        dfs(valid_configs, queens + [col_idx], yx_diffs + [row_idx - col_idx], yx_sums + [row_idx + col_idx], n)
      end
    end
  end
end
 
def solve_n_queens(n : Int32) : Array(Array(String))
  result = [] of Array(Int32)
 
  dfs(result, [] of Int32, [] of Int32, [] of Int32, n)
 
  board_solutions = result.map do |sol|
    sol.map do |i|
      "." * i + "Q" + "." * (n - i - 1)
    end
  end
 
  board_solutions.map { |solution| solution.to_a }
end
 
 
n = 4
solutions = solve_n_queens(n)
 
solutions.each do |solution|
  solution.each do |row|
    puts row
  end
  puts
end
