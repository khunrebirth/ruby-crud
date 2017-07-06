# Ruby Programming
# Example CRUD by Ruby Language
# Author    : ThanuSin
# Tutor     : Jake Day Williams (https://www.youtube.com/channel/UCuRCaGY0u5tOtgyZuPqQReA)

# Functions
def show_display
    puts '==================================='
    puts 'What would you like to do? Options:
    - Add
    - Update 
    - Delete 
    - Show list'
    puts '==================================='
end

def get_list_book(list)
    list.each {|book, rating| puts "#{book}: #{rating}"}
end

def error_message
    puts "Error! You've broken something! :("
end

# Book list
list_books = {
    :java   => 9,
    :php    => 9,
}

# Start Program
show_display
choice = gets.chomp

# Process
case choice
# Add Process
when 'add'
    print 'What book would you like to add to your list? : '
    title = gets.chomp
    if list_books[title.to_sym].nil?
        print 'What rating do you give this book? (Between 1 and 10) : '
        rating = gets.chomp
        list_books[title.to_sym] = rating.to_i
        puts "#{title} has been added to your list with a rating #{rating}"
    else puts 'That book is already in your list!'
    end
# Update Process
when 'update'
    get_list_book(list_books)
    print "What book's rating woruld you like to change? : "
    title = gets.chomp
    if list_books[title.to_sym].nil? 
        puts 'Error! Books not found!'
    else 
        print 'What new rating would you give it? : '
        rating = gets.chomp
        list_books[title.to_sym] = rating.to_i
        puts "Your rating for #{title} has been updated to #{rating}!"
    end  
# Delete Process
when 'delete'
    print 'What title would you like to removed? : '
    title = gets.chomp.to_sym
    if list_books[title.to_sym].nil? 
        puts 'Error! Books not found!'
    else 
        list_books.delete(title)
        puts "#{title} has been deleted!"
    end
# Show List
when 'show list' 
    get_list_book(list_books)
# Other
else error_message
end

puts list_books