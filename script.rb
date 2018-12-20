module Enumerable
    def my_each
        self.length.times { |i| yield(self[i]) }
    end
    def my_each_with_index
        self.length.times { |i| yield(self[i], i) }
    end
    def my_select
        return_array = []
        self.my_each { |e| yield(e) && return_array<<e }
        return_array
    end
    def my_all?
        all_pass = true
        self.my_each { |e| !yield(e) && all_pass = false }
        all_pass
    end
    def my_any?
        any_pass = false
        self.my_each { |e| yield(e) && any_pass = true }
        any_pass
    end
    def count
        count = 0
        self.my_each { |e| yield(e) && count+=1 }
        count
    end
    def my_map
        return_array = []
        self.my_each { |e| return_array<<yield(e) }
        return_array
    end
    def my_inject
        total = self[0]
        (self.length-1).times { |i| total = yield(total, self[i+1]) }
        total
    end
end

def multiply_els array
    array.my_inject { |total, e| total * e}
end


test_array = [1,2,3,4,5]
test_proc = Proc.new { |e| e * 2}

puts test_array.my_map { |e| e * 2 }
