require('pry-byebug')

require_relative('../db/SqlRunner.rb')

class Animal

  attr_reader :id, :owner_id
  attr_accessor :name, :type, :image_url, :admission_date, :available_for_adoption

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @name = options['name']
    @image_url = options['image_url']
    @type = options['type']
    @admission_date = options['admission_date']
    @available_for_adoption = options['available_for_adoption']
    @owner_id = options['owner_id'].to_i() if options['owner_id']
  end

  def save()
    sql = "INSERT INTO animals (name, type, image_url, admission_date, available_for_adoption) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @type, @image_url, @admission_date, @available_for_adoption]
    results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i()
  end

  def update()
    sql = "UPDATE animals SET (name, type, image_url, admission_date, available_for_adoption) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@name, @type, @image_url, @admission_date, @available_for_adoption, @id]
    SqlRunner.run(sql, values)
  end

  def update_owner_id()
    sql = "UPDATE animals SET owner_id = $1 WHERE id = $2"
    values = [@owner_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = "DELETE FROM animals WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def assign_owner(owner_id)
    if (owner_id == 'nil')
      @owner_id = nil
    else
      @owner_id = owner_id
      @available_for_adoption = false
      update()
    end
    update_owner_id()
  end

  def has_owner?()
    if (@owner_id)
      return true
    end
    return false
  end

  def get_status_class()
    if (has_owner?() == false && @available_for_adoption == true || @available_for_adoption == 't')
      return "status-available"
    elsif (has_owner?())
      return "status-adopted"
    else
      return "status-unavailable"
    end
  end

  def self.delete_all()
    sql = "DELETE FROM animals"
    SqlRunner.run(sql)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM animals WHERE id = $1"
    values = [id]
    results = SqlRunner.run(sql, values)
    result = results.first()
    if (result != nil)
      return Animal.new(result)
    end
    return nil
  end

  def self.find_by_type_or_name(query)
    sql = "SELECT * FROM animals WHERE type ILIKE $1 OR name ILIKE $1"
    values = [type]
    results = SqlRunner.run(sql, values)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.find_by_owner(owner_id)
    sql = "SELECT * FROM animals WHERE owner_id = $1"
    values = [owner_id]
    results = SqlRunner.run(sql, values)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.all()
    sql = "SELECT * FROM animals ORDER BY admission_date DESC"
    results = SqlRunner.run(sql)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.all_unavailable_for_adoption()
    sql = "SELECT * FROM animals WHERE owner_id IS NULL AND available_for_adoption = false ORDER BY admission_date DESC"
    results = SqlRunner.run(sql)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.all_available_for_adoption()
    sql = "SELECT * FROM animals WHERE available_for_adoption = true ORDER BY admission_date DESC"
    results = SqlRunner.run(sql)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.all_adopted()
    sql = "SELECT * FROM animals WHERE owner_id IS NOT NULL ORDER BY admission_date DESC"
    results = SqlRunner.run(sql)
    return results.map() {|animal| Animal.new(animal)}
  end

  def self.get_types()
    sql = "SELECT DISTINCT ON (lower(type)) type FROM animals ORDER BY lower(type) ASC"
    results = SqlRunner.run(sql)
    return results.map() {|animal| animal["type"]}
  end

end
