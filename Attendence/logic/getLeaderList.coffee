path = require 'path'
csv = require 'csv'

lib = require('./lib')
constants = require('../config/constants')

# leaderList = []
exports.getLeaderData = (filePath,callback)->
    csv()
    .from.path(filePath)
    .to.array(
      (data,count)->
        leaderList = []
        for row in data[1..] when row.join('') isnt ''
          leaderList.push(row[1])
        console.log "getLeaderData function"
        callback(null,leaderList)
    )
