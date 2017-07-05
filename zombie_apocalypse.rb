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
    Zombie.new(rand(0..@@max_speed), rand(0..@@max_strength)) >> @@horde
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

def some_die_off
  number_of_zombies_that_die_off = rand(0..10)
  number_of_zombies_that_die_off.times do |zombie|
    @@horde.pop
  end
end

def encounter

end

def outrun_zombie
  my_speed = rand(0..@@max_speed)
  if my_speed > @speed
    return true
  else
    return false
end




end
