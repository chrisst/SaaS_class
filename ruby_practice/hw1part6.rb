#!/usr/bin/ruby -w
require 'forwardable'

class CartesianProduct
    include Enumerable
    extend Forwardable

    attr_reader :final
    
    def initialize(list1, list2)

        @final = []
        list1.each do |a1|
            list2.each do |a2|
                @final << [a1, a2]
            end
        end
    end

    def_delegators :@final, :each

end



