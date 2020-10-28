class Station
  attr_reader :name, :trains

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def list_of_trains_by_type(type)
    @trains.select { |train| train.type == type }
  end

  def delete_train(train)
    @trains.delete(train)
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
  attr_accessor :speed, :current_station

  attr_reader :number_of_cars, :type

  def initialize(number, type, number_of_cars)
    @number = number
    @type = type
    @number_of_cars = number_of_cars
    @speed = 0
    @current_station  
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
    @current_station = way.starting_station
    @current_station.add_train(self)
  end

  def move_forward
    @current_station.delete_train(self)
    @current_station = @way.route[@way.route.index(current_station) + 1] if @train_in_station != @way.terminal_station
    @current_station.add_train(self)   
  end

  def move_back
    @current_station.delete_train(self)
    @current_station = @way.route[@way.route.index(current_station) - 1] if @train_in_station != @way.starting_station
    @current_station.add_train(self)
  end

  def next_station
    @next_station = @way.route[@way.route.index(current_station) + 1]

  end

  def last_station
    @last_station = @way.route[@way.route.index(current_station) - 1]
  end
end
