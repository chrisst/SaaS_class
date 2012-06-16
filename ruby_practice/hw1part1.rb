#!/usr/bin/ruby -w

def palindrome?(str)
    if str.downcase.gsub(/[\W]/, '') == str.downcase.reverse.gsub(/[\W]/, '')
        return true
    else
        return false
    end
end

def count_words(str)
    hsh = {}
    str.split(/\b/).each do |word|
        if not word.gsub(/\W/, '').empty?
            hsh[word.gsub(/\W/, '').downcase] = hsh.fetch( word.gsub(/\W/, '').downcase, 0) + 1
        end
    end
    return hsh
end

puts count_words("A man, a plan, a canal -- Panama").inspect
puts count_words("one two two three three three").inspect

def testPalindrome()
    testString = "foobar"
    puts "testing: " + testString
    puts "       %s" % palindrome?(testString)
    puts 
    testString = "foof"
    puts "testing: " + testString
    puts "       %s" % palindrome?(testString)
    puts 
    testString = "I'm a ll a m'I"
    puts "testing: " + testString
    puts "       %s" % palindrome?(testString)
    puts 
    testString = "j(i  I j"
    puts "testing: " + testString
    puts "       %s" % palindrome?(testString)
    puts 
    testString = "Madam, I'm Adam!"
    puts "testing: " + testString
    puts "       %s" % palindrome?(testString)
    puts 

end



