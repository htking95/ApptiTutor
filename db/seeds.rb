# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'httparty'
responce = HTTParty.get("http://api.purdue.io/odata/Subjects")
for r in responce["value"]
    #puts r
    s = "http://api.purdue.io/odata/Courses?$filter=Subject/Abbreviation eq '"
    s << r["Abbreviation"]
    s << "'&$orderby=Number asc"
    c = HTTParty.get(s)
    for v in c["value"]
        if v["Number"][0] != ""
            Course.create( "subject" => r["Abbreviation"], "course_Num" => v["Number"] )
        end
    end
end
