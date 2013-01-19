# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'rubygems'
require 'mongoid'
require "mongo"
require "bson"
require 'yaml'
require 'logger'
require 'csv'

class Profile

  def initialize
    # CHECKING
    p 'Tables details'
 
    # DB CONNECTION
    db = Mongo::Connection.new("localhost", 27017).db("kidslink")
    
    # INITIALIZE PROFILE TABLE
    @profiles = db.collection('profiles')

    # CHECKING COUNT ON TABLE
    p 'Count no of rows in table'
    p @profiles.count  
    
    
    # INITIALIZE ORGMEMBERSHIP TABLE
    org_member =  db.collection('organization_memberships').find('seasons.season_year' => '2013-2014')
    p org_member.count
    # org_member.each do |each_org|
    #     p each_org
    # end
        
    csv_string = CSV.generate do |csv|
      csv << ['Org Id', 'Id']
      org_member.each do |each_org|
        csv << [each_org['org_id'], each_org['_id']]
      end  
    end
   #  send_data( csv_string,:type => 'text/csv; charset=iso-8859-1; header=present',
   # :disposition => "attachment; filename=profiles.csv")
   p csv_string
  end

end

Profile.new

