csv = require 'csv'
fs =  require 'fs'
xls = require 'xlsjs'
iconv = require 'iconv-lite'
moment = require 'moment'
handlebars = require 'handlebars'
util = require('util')

mail = require './send_mail'

exports.getDataFromCSV = (filename, callback)->
  csv()
  .from.path(filename)
  .to.array callback