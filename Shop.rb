load 'candy.rb'
load 'shelf.rb'

attr_reader :candy_list , :shelf_list

#Construct the array of shelf and candy. 
def initialize
    @candy_list = []
    @shelf_list = []
end

 # Creates new candy object and adds it @candy_list 
def add_candy(candy_name)
    if !@candy_list.any?{|candy| candy.candy_name.casecmp?(candy_name)}
      new_candy = Candy.new(candy_name)
      @candy_list.push(new_candy)
      puts "Added candy."
    else puts "Candy already exists"
    end
  end

 # Creates new shelf object and adds it @shelf_list
  def add_shelf
    index = get_next_shelf_index
    new_shelf = Shelf.new(index)
    @shelf_list.push(new_shelf)
  end 

  def get_shelf_index(shelf_id)
    @shelf_list.find_index{|shelf| shelf.shelf_id == shelf_id}
  end

    # Makes candies in that shelf unshelved
   def remove_shelf(shelf_id)
    index = get_shelf_index(shelf_id)
    @shelf_list[index].candy_list.each{|candy| candy.set_candy_display(false)}
    @shelf_list.delete_at(index)
  end

  def get_candy(candy_name)
    index = @candy_list.find_index{|candy| candy.candy_name.casecmp?(candy_name)}
    return @candy_list.at(index)
  end

  def get_next_shelf_index
    if @shelf_list.empty?
      return 1
    else return (@shelf_list.last.shelf_id + 1)
    end
  end

  # This list of candies is displayed
  def list_displayed_shelves
    @shelf_list.each{|shelf|
      if shelf.is_displayed == true
        puts shelf.shelf_id
      end
    }
  end
    
  # Finds the total number of candies in all shelves
def count_shelves
    @shelf_list.count
  end

  def print_shelf_contents
    @shelf_list.each{|shelf|
      if shelf.is_displayed == true
        puts("Shelf #{shelf.shelf_id}: ")
        puts shelf.print_candies
      end
    }
    puts
  end

  def print_unshelved_candies
    @candy_list.each{|candy|
      if candy.is_shelved == false
        puts candy.candy_name
      end
    }
    puts
  end

  def print_all_candies
    @candy_list.each{|candy|
      puts candy.candy_name
    }
    puts
  end

end
