class Counter
    @qtt = 0

    def self.qtt
        @qtt
    end

    def self.add
        @qtt += 1
    end
end
