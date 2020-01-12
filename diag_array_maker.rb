require 'csv'
filename = 'diagtest'
  def export(filename, array)
    filename = 'test_boards/' + filename + '.csv'
    CSV.open(filename, 'w') do |csv|
      array.each do |row|
        csv << row
      end
    end
  end
diag_test = Array.new(6) do |x|
  row = []
  7.times do  |y|
    if (x + y) % 2 == 0
      row << "X"
    else
      row << "O"
    end
    print x, y, row
    puts
  end
  row
end
diag_test.each do |x|
  p x
end
export(filename,diag_test)
