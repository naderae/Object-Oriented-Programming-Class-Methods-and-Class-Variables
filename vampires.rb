class Vampires

@@vampires_list = []

def initialize(name, age)
  @name = name
  @age = age
  @in_coffin = true
  @drank_blood_today = false
end

def in_coffin
  return @in_coffin
end

def in_coffin= (in_coffin)
  @in_coffin = in_coffin
end

def drank_blood_today
  return @drank_blood_today
end

def drank_blood_today= (drank_blood_today)
  @drank_blood_today = drank_blood_today
end


def self.create(name, age)
  new_zombie = Vampires.new(name, age)
  @@vampires_list.push(new_zombie)
end
end



def drink_blood
  @drank_blood_today = true
end

def self.sunrise
  @@vampires_list.each do |vampire|
    if  vampire.drank_blood_today == false && vampire.in_coffin == false
      @@vampires_list.delete(vampire)
    end
end

def self.sunset
  @@vampires_list.each do |vampire|
    vampire.in_coffin= false
    vampire.drank_blood_today= false
  end
end

def go_home
  @in_coffin = true
end
