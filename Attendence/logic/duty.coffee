lib = require('./lib')
path = require('path')
constants = require('../config/constants')

# exports.getDutyArrange = (callback)->
#   transformToList = (data,count) ->
#     specialPersonMap = {}
#     for row,j in data[2..] when row.join('') isnt ''
      
#       specialPersonMap[row[2]] = timeList = []

#       for cell,i in row[5..] by 2 
#         start = if !!row[5+i] then new Date(row[5+i]) else null
#         stop = if !!row[5+i+1] then new Date(row[5+i+1]) else null
#         timeList.push row[5+i]
#         timeList.push row[5+i+1]

#       exports.specialPersonMap = specialPersonMap 

#     callback? null, specialPersonMap

#   filename = path.join(__dirname, constants.dutyTimeTableCsv)#'../csvfiles/DutyTimeTable.csv'
#   lib.getDataFromCSV filename, transformToList

exports.getDutyArrange = (callback)->
  transformToList = (data,count) ->
    Map = ->
    specialPersonMap = new Map
    for row in data[0..] when row.join('') isnt ''
      # for i in row
      depart = row[0]
      name = row[1]
      specialPersonMap[name] = depart
    # console.log specialPersonMap
    # exports.specialPersonMap = specialPersonMap

    callback(null,specialPersonMap)
    # callback? null, specialPersonMap
  filename = path.join(__dirname, constants.specialMapCsv)#'../csvfiles/DutyTimeTable.csv'
  lib.getDataFromCSV filename, transformToList


      