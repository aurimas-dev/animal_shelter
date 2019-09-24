require('date')
require_relative('../db/SqlRunner.rb')

class Log

  attr_reader :id, :timestamp, :category, :message

  def initialize(options)
    @id = options['id'].to_i() if options['id']
    @timestamp = options['timestamp'] if options['timestamp']
    @category = options['category']
    @message = options['message']
  end

  def datetime()
    result = DateTime.parse(@timestamp)
    return result.strftime('%Y %b %d %T')
  end

  def self.action(category, message)
    sql = "INSERT INTO logs (category, message) VALUES ($1, $2)"
    values = [category, message]
    SqlRunner.run(sql, values)
  end

  def self.all()
    sql = "SELECT * FROM logs ORDER BY logs DESC LIMIT 100"
    results = SqlRunner.run(sql)
    return results.map() {|log| Log.new(log)}
  end

  def self.all_by_category(category)
    sql = "SELECT * FROM logs WHERE category = $1 ORDER BY logs DESC LIMIT 100"
    values = [category]
    results = SqlRunner.run(sql, values)
    return results.map() {|log| Log.new(log)}
  end

  def self.delete_all()
    sql = "DELETE FROM logs"
    SqlRunner.run(sql)
  end

end
