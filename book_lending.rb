class Book

@@on_shelf = []
@@on_loan =  []

def initialize(title, author, isbn)
  @title = title
  @author = author
  @isbn = isbn
  @due_date = nil
  @lent_out = false
end




def due_date
  return @due_date
end

def due_date=(due_date)
  @due_date = due_date
end



def self.create
  new_book = Book.new(title, author, isbn)
  @@on_shelf << new_book
  return new_book
end

def self.available
  return @@on_shelf
end

def self.borrowed
  return @@on_loan
end

def self.browse
  return @@on_shelf.sample
end

def lent_out?
   return @lent_out
end

def self.current_due_date
  Time.now + 1209600
end

def borrow
  if lent_out?
    puts self.lent_out?
    return false
  else
    @due_date = Book.current_due_date
    @@on_shelf.delete(self)
    @@on_loan.push(self)
    return true
end

def return_to_library
  if self.lent_out? == false
    return false
  else
    @@on_loan.delete(self)
    @@on_shelf.push(self)
    @due_date = nil
    return true
end

def self.overdue
  overdue_books = []
  @@on_loan.each do |book|
    if book.due_date < Time.now
      overdue_books.push(book)
      return overdue_books
    end
  end
end

book_1 = Book.new ("naders life story", "nader abou_ezze", "1242345")
book_1.lent_out?
book_1.borrow
























end
