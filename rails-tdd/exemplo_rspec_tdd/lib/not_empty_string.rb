class NotEmptyString < String
    def initialize
        self << "I'm not empty!!"
    end
end