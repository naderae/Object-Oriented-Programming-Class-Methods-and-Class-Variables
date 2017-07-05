class Zombie
@@horde = []
@@plague_level = 10
@@max_speed = 5
@@max_strength = 8
@@default_speed = 1
@@default_strength = 3

def initialize(speed, strength)
    @speed = speed
    @strength = strength
end

def self.all
  return @@horde
end

def self.spawn
  number_of_spawned_zombies = rand(0..@@plague_level)
  number_of_spawned_zombies.times do |zombie|
    new_zombie = Zombie.new(rand(0..@@max_speed), rand(0..@@max_strength))
    @@horde << new_zombie
  end
end


def self.new_day
  some_die_off
  spawn
  increase_plague_level
end

def self.increase_plague_level
  @@plague_level += rand(0..2)
end

def self.some_die_off
  die_off = rand(0..10)
  die_off.times do
    @@horde.pop
  end
end

def encounter
  if outrun_zombie? == true
    puts "You have escaped the zombie"
  elsif survive_attack? == false
    puts "You have been killed by the zombie"
  else
    your_a_zombie = Zombie.new(rand(0..@@max_speed), rand(0..@@max_strength))
    @@horde >> your_a_zombie
    puts "Your infected boy!"
  end

end

def outrun_zombie?
  my_speed = rand(0..@@max_speed)
  if my_speed > @speed
    return true
  else
    return false
  end
end

def survive_attack?
  your_stength = rand(0..@@max_strength)
  if your_stength > @strength
    return true
  else
    return false
  end
end



end

Zombie.spawn
puts Zombie.all

puts "this is the end"

Zombie.new_day
puts Zombie.all
