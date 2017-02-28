=begin
1.畫出格子（印出來）
2.輸入ＯＸ （輪流輸入一次，每次不得重覆）(印出來)
3.判斷誰是贏家(直線、橫線、斜線)
4.沒人贏家為平手 重覆換人輸入
=end
class Board
  def initialize
    @board = Array.new(3){Array.new(3," ")}
  end
  def printInstructions
    puts "1 | 2 | 3",
         "---------",
         "4 | 5 | 6",
         "---------",
         "7 | 8 | 9"
    print "\n"
  end

  def drawox(actor_player,row,col)
     if (0..2) === row && (0..2) === col && @board[row][col] == " "
       puts "drawox"
       return @board[row][col] = actor_player
     end
  end

  def printBoard
    (0..2).each do |row|
      (0..2).each do |col|
        print @board[row][col]
        #print array[row][col]
        print "|" unless col == 2
      end
      print "\n"
      print "- - - \n" unless row ==2
    end
  end

  def findWinner
    #先找直線 和 橫線 是否為一樣
    (0..2).each do |i|
      if @board[0][i] == @board[1][i] && @board[1][i] == @board[2][i]
        return @board[0][i] unless @board[0][i] == " "
      elsif @board[i][0] == @board[i][1] && @board[i][1] == @board[i][2]
        return @board[i][0] unless @board[i][0] == " "
      end
    end

    #在找斜線是否為一樣 有從左斜到右＆從右斜到左
    if ( @board[0][0] == @board[1][1] && @board[1][1] == @board[2][2]) || ( @board[0][2] == @board[1][1] && @board[1][1] == @board[2][0])
      return @board[1][1] unless @board[1][1] == " "
    end

    #直到每格都有畫ＯＯＸＸ了就回傳 E。END(平手)
    return "E" unless @board.join.include?(" ")

    #表示還有空格，那就繼續。continue
    return "C"
  end
end

board = Board.new

actor_player = "O"

board.printInstructions
puts "OOXX 遊戲開始！！！！"
print "\n\n"

while board.findWinner == "C"
  puts "換 #{actor_player}下了！！！ 請選擇要下哪個地方！"

  stack =gets.to_i-1
  #puts "QQQQQQ"
  #puts stack
  row = stack / 3
  col = stack % 3


  if board.drawox(actor_player,row,col)
    if actor_player == "O"
      actor_player = "X"

    else
      actor_player = "O"

    end
  else
    puts "有重覆或者無效！！！請重新選擇！！！！"
  end

  board.printBoard
end

winner = board.findWinner

puts "********"
print "\n"

if winner == "E"
  puts "平手辣！！！"
else
  puts "#{winner} 贏辣！！！"
end
print "\n"
board.printBoard
print "*---------*"
