path = require 'path'
csv = require 'csv'

lib = require('./lib')
constants = require('../config/constants')
Person = require '../Person'

# mobile_Dapartment = constants.mobileNamesList
presidents = constants.presidents

exports.dealMapData = (map,specialPersonMap,leaderList,mobile_Dapartment,presidents,startLine,deadLine,tempalteModeKind,callback)->
    # console.log map
    csv()
    .from.path('.' + constants.attendenceCsvPath)        
    .to.array((data,count) ->
      head = data[0]
      virtualDay = []
      for i in [0...head.length] when !!head[i]
        virtualDay.push(head[i])

      # startDay = virtualDay[1]
      # deadlineDay = virtualDay[virtualDay.length-1]

      YearAndMon = data[2][4]

      for row in data[2..] when row.join('') isnt '' 
        per = new Person(row,head,specialPersonMap,leaderList,mobile_Dapartment,presidents,map,startLine,deadLine,YearAndMon,tempalteModeKind)
        per.Process()
      callback()
      # console.log map
    )