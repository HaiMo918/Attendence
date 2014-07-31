csv = require 'csv'
fs =  require 'fs'

moment = require 'moment'
util = require 'util'
iconv = require 'iconv-lite'
thenjs = require 'thenjs'

duty = require('./logic/duty')
constants = require('./config/constants')
xls2csv = require('./libs/XLS2CSV')
jbk2utf = require('./libs/GBK2UTF8')
Person = require './Person'

getLeaderList = require('./logic/getLeaderList')
getMobileList = require('./logic/getMobileList')
getEmailList = require('./logic/getEmailList')
dealMap = require('./logic/DealMap')

# leaderList = []
# mobile_Dapartment = constants.mobileNamesList
presidents = constants.presidentsList

Map = ->
exports.map = map = new Map

thenjs.parallel([
  (defer)->      
    xls2csv.readxls2csv(constants.attendenceExl,constants.attendenceCsv, (err, data)->
      defer err, data
    )
  ,
  (defer)->
    xls2csv.readxls2csv(constants.leadersExl,constants.leadersCsv,(err,data)->
      defer err,data
    )
  ,
  (defer)->
    jbk2utf.writeJbk2Utf(constants.emailAddressCsv,constants.emailList01Csv,(err,data)->
      defer err,data
    )
  # ,
  # (defer)->
  #   xls2csv.readxls2csv(constants.dutyExl,constants.dutyCsv,(err,data)->
  #     defer err,data
  #   )
  ,(defer)->
    xls2csv.readxls2csv(constants.mobileExl,constants.mobileCsv,(err,data)->
      defer err,data
    )
  ,(defer)->
    xls2csv.readxls2csv(constants.specialListExl,constants.specialListCsv,(err,data)->
      defer err,data
    )
])
.then(
  (defer)->
    getLeaderList.getLeaderData(constants.leadersCsv,defer)    
)
.then(
  (defer,leaderList)->
    getMobileList.getMobileData(constants.mobileCsv,leaderList,defer)
)
.then(
  (defer,leaderList,mobileList)->
    getEmailList.dealEmailData(constants.emailList01Csv,leaderList,mobileList,defer)
)
.then((defer,leaderList,mobileList,map)->
  # console.log map
  exports.getMap = getMap = duty.getDutyArrange (err,specialPersonMap) ->
    # console.log 'specialPersonMap------',specialPersonMap
    startLine = process.argv[2]
    deadLine = process.argv[3]
    tempalteModeKind = process.argv[4]
    # console.log tempalteModeKind
    dealMap.dealMapData(map,specialPersonMap,leaderList,mobileList,presidents,startLine,deadLine,tempalteModeKind,defer)
)
.then(
  (defer)->

    console.log "then done!!"
)
.fail((defer,err)->
  console.log "====="
  console.error err
  console.log "err"
)




