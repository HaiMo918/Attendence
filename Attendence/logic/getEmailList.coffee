path = require 'path'
csv = require 'csv'

lib = require('./lib')
constants = require('../config/constants')

exports.dealEmailData = (filePath,leaderList,mobileList,callback)-> 
  csv()
  .from.path(filePath)                         #.from.path(__dirname + constants.emailList01)
  .to.array(
    (data)->
      Map = ->
      map = new Map
      for row in data[1..] when row.join('') isnt ''
        for i in row
          keystr = row[0].split("-")
          list_name = keystr[1]
          email = row[1]
          map[list_name] = email
          # if email is "zhang.qin@baidao.com"
          #   list_name = "张勤女"
          #   # console.log list_name
          #   map[list_name] = email
          for email of constants.sameNameList
            list_name = constants.sameNameList[email]
            map[list_name] = email
            
      # console.log "map---------",map
      callback(null,leaderList,mobileList,map)
    )

# sameNameDeal = (element)->
#   if element is "zhang.qin@baidao.com"
  
  