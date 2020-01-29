class CashRegister

    attr_accessor :discount, :total, :items, :last_item
    
    def initialize(employee_discount=nil)
    @total = 0
    @discount = employee_discount
    @items = []
    end

    def add_item(item_title, price, quantity=1)
        @total += price * quantity
        @last_item = price * quantity
        quantity.times {@items << item_title}
    end

    def apply_discount 
        if discount
            @total -= @total * (@discount * 0.01)
            return "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end 
    end

    def void_last_transaction
        @total -= @last_item
    end

end