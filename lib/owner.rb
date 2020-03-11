class Owner
  
  attr_reader :name, :species

  @@all = []

  def initialize(name)
    @name = name
    @species = "human"

    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end
  def buy_cat(name)
    return Cat.new(name, self)
  end
  def buy_dog(name)
    return Dog.new(name, self)
  end
  def cats
    Cat.all.select {|cat| cat.owner == self}
  end
  def dogs
    Dog.all.select {|dog| dog.owner == self}
  end
  def list_pets
    return "I have #{self.dogs.size} dog(s), and #{self.cats.size} cat(s)."
  end
  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end
  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  def sell_pets
    self.dogs.each do |dog|
      dog.owner = nil 
      dog.mood = "nervous"
    end
    self.cats.each do |cat|
      cat.owner = nil 
      cat.mood = "nervous"
    end
  end

  def self.all
    return @@all
  end
  def self.count
    return @@all.size
  end
  def self.reset_all
    @@all = []
  end
end