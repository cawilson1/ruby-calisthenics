module FunWithStrings
  def palindrome?
    self.delete!("^a-zA-Z")
    self.downcase.reverse == self.downcase
  end
  def count_words
    arr = self.split(" ")
    arr.each{|v| v.downcase!}
    arr.each{|v| v.gsub!(/[\W]/, '')}
    count_hash = Hash.new(0)
    arr.each{|v| count_hash[v]+= 1}
    count_hash.delete('')
    return count_hash
  end
  
  def anagram_groups
    return [] if self == ""
    arr = self.split(" ")
    #array to return
    returnArr = []
    #elements that do have anagrams to compare to non-anagram arrays
    anagramIsTrue = []
    counter = 0
    arr.each{|v1|
      arr.each{|v2|
        unless v1==v2
          if v1.chars.sort.join == v2.chars.sort.join
            returnArr[counter] = [v1,v2]
            anagramIsTrue[counter] = v1
            counter += 1
          end
        end
      }
    }
    
    arr.each{|v|  if !anagramIsTrue.include? v 
      returnArr[counter] = [v] 
      counter += 1
    end
    }
          
    return returnArr
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
