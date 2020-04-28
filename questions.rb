class Questions
  attr_reader :num1, :num2, :sum

  def initialize()
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @sum = @num1 + @num2
  end

  def correct?()
    answer = gets.chomp.to_i
    answer == self.sum
  end
end