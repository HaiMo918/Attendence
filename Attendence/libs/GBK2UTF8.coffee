csv = require 'csv'
fs =  require 'fs'
iconv = require 'iconv-lite'
path = require('path')

# lib = require('./logic/lib')

exports.writeJbk2Utf = (readFile,writeFile,callback) ->

	fs.readFile(readFile,(err,data)->
	  if err
	    console.error err
	  else
	    str = iconv.decode(data,'GBK')
	    fs.writeFile(writeFile,str,'utf8',(err)->
	      if err
	        throw err
	      else
	        console.log 'GBK2UTF8 saved!'
	      )
			callback()
	)


# abc = ->
# 	console.log 'superwolf'

# exports.writeJbk2Utf(abc)

# exports.writeJbk2Utf = (readFile,writeFile) ->
# 	fs.readFile('./csvfiles/EmailAddress.csv',(err,data)->
# 	  if err
# 	    console.error err
# 	  else
# 	    str = iconv.decode(data,'GBK')
# 	    fs.writeFile('./csvfiles/emailList01.csv',str,'utf8',(err)->
# 	      if err
# 	        throw err
# 	      else
# 	        console.log 'GBK2UTF8 saved!'
# 	      )
# 	    )