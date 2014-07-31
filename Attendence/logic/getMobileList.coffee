path = require 'path'
csv = require 'csv'

lib = require('./lib')
constants = require('../config/constants')

# leaderList = []
exports.getMobileData = (filePath,leaderList,callback)->
    csv()
    .from.path(filePath)
    .to.array(
      (data,count)->
        MobileList = []
        for row in data[0..] when row.join('') isnt ''
          MobileList.push(row[0])
        # console.log "getLeaderData function"
        callback(null,leaderList,MobileList)
    )
