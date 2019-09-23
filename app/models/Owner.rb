require('pry-byebug')

require_relative('../db/SqlRunner.rb')
require_relative('./Animal.rb')

class Owner

  attr_reader :id
  attr_accessor :name, :capacity

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @capacity = options['capacity'].to_i()
  end

  def save()
    sql = "INSERT INTO owners (name, capacity) VALUES ($1, $2) RETURNING id"
    values = [@name, @capacity]
    result = SqlRunner.run(sql, values)
    @id = result.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE owners SET (name, capacity) = ($1, $2) WHERE id = $3"
    values = [@name, @capacity, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def get_owned_animals()
    return Animal.find_by_owner(@id)
  end

  def get_status_class()
    if (get_owned_animals().count() < @capacity)
      return "status-available"
    else
      return "status-adopted"
    end
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM owners WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    result = results.first()
    if (result != nil)
      return Owner.new(result)
    end
    return nil
  end

  def self.delete_all()
    sql = "DELETE FROM owners"
    SqlRunner.run(sql)
  end

  def self.all()
    sql = "SELECT * FROM owners ORDER BY id DESC"
    results = SqlRunner.run(sql)
    return results.map() {|owner| Owner.new(owner)}
  end

  def self.all_available()
    owners = Owner.all()
    return owners.select() {|owner| owner.get_owned_animals().count() < owner.capacity()}
  end

end
