class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s # make sure it's a string
    attr_reader attr_name # create the attribute's getter
    attr_reader attr_name+"_history" # create bar_history getter
    class_eval %Q{
      def #{attr_name}= thing
      
        if (!defined?(@#{attr_name}_history))
            @#{attr_name}_history = []
        end
        
        @#{attr_name}_history.push(@#{attr_name})
        @#{attr_name} = thing
      end
    }


  end
end


class Yo
    attr_accessor_with_history :test
end

you = Yo.new
you.test = :wow
you.test = "done"
you.test = :wow
you.test = nil
you.test = "and"
print you.test_history