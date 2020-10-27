class Station
  attr_reader :name, :train

  def initialize(name)
    @name = name
    @train = []
  end

  def add_train(train)
    @train << train
  end

  def list_of_trains
    @train.each { |train| puts train }
  end

  def list_of_trains_by_type
    @train.each { |train| puts train.type }
  end

  def delete_train(train)
    @train.delete(train)
  end
end

class Route
  attr_reader :route, :starting_station, :terminal_station

  def initialize(starting_station,terminal_station)
    @starting_station = starting_station
    @terminal_station = terminal_station
    @route = [@starting_station, @terminal_station]  
  end

  def add_station(station)
    @route.insert(1, station)
  end

  def delete_station(station)
    @route.delete(station)
  end
end

class Train
  attr_accessor :speed, :train_in_station

  attr_reader :number_of_cars, :type

  def initialize(number, type, number_of_cars)
    @number = number
    @type = type
    @number_of_cars = number_of_cars
    @speed = 0
    @train_in_station  
  end

  def stop
    self.speed = 0
  end

  def add_number_of_cars
    @number_of_cars += 1 if @speed == 0
  end

  def delete_number_of_cars
    @number_of_cars -= 1 if @speed == 0
  end

  def add_train_to_route(way)
    @way = way
    @train_in_station = way.starting_station
    @train_in_station.add_train(self)
  end

  def move_forward
    @train_in_station.delete_train(self)
    @train_in_station = @way.route[@way.route.index(train_in_station) + 1] if @train_in_station != @way.terminal_station
    @train_in_station.add_train(self)   
  end

  def move_back
    @train_in_station.delete_train(self)
    @train_in_station = @way.route[@way.route.index(train_in_station) - 1] if @train_in_station != @way.starting_station
    @train_in_station.add_train(self)
  end

  def current_station
    next_station = @way.route[@way.route.index(train_in_station) + 1] 
    last_station = @way.route[@way.route.index(train_in_station) - 1]
    puts "Прошлая станция: #{last_station.name}, текущая станция: #{train_in_station.name}, следуюшая станция: #{next_station.name}"
  end
end
