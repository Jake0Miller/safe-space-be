class Demand
  def initialize(demand, stock)
    @demand = demand
    @stock = stock
  end

  def add_need(num)
    @demand += num
  end
end
