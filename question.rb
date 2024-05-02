class Question 

  attr_reader :num1, :num2, :operation, :answer
  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = self.num1 + self.num2
  end

end