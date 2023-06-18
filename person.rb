class Person
    attr_accessor :name
    @name
    def initialize(name)
        @name=name
    end
    def valid_name(name)
        if name.match(/\A[[:alpha:]]+\z/)
            return true
        else
            return false
        end
    end
end
