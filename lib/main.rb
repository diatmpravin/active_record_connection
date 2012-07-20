# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'rubygems'
require 'active_record'
require 'yaml'
require 'logger'

dbconfig = YAML::load(File.open('db_connection.yml'))
ActiveRecord::Base.establish_connection(dbconfig)
ActiveRecord::Base.logger = Logger.new(STDERR)
ActiveRecord::Base.logger = Logger.new(File.open('database.log', 'a'))

class Location < ActiveRecord::Base

  def initialize
    p 'Tables details'
    p Location
    
    p 'Count no of rows in table'
    p Location.count
  end

end

Location.new