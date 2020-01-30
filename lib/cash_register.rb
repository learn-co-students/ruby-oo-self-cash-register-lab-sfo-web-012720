
class CashRegister

    attr_accessor :total, :previous_total, :discount, :items
    
    def initialize(discount = 0)
        @total = 0.0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 0)
        @previous_total = @total
        if quantity != 0
            @total += price*quantity
        else
            @total += price
        end
        if quantity !=0
            quantity.times do
                @items << title
            end
        else
            @items << title
        end
    end

    def apply_discount
        @previous_total = @total 
        if @discount != 0
            self.total = (total * ((100.0 - discount.to_f)/100)).to_i
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def items
        return @items
    end

    def void_last_transaction

        @items.pop
        @total = @previous_total
        if @items == []
            @total = 0
        end
    end
end