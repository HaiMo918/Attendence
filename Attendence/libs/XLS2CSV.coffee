xls = require 'xlsjs'
fs =  require 'fs'


exports.readxls2csv = (xlsfile,csvfile,callback)->
  xlsDutyMonfile = xls.readFile(xlsfile)
  sheetname = ''
  target_sheet = sheetname || ''
  if target_sheet is ''
    target_sheet = xlsDutyMonfile.SheetNames[0]
  try
    ws = xlsDutyMonfile.Sheets[target_sheet]
    throw "Sheet #{target_sheet} cannot be found" unless ws
  catch e
    console.error "xls2csv: error parsing  #{target_sheet}: #{e}" ##{filename}
    process.exit(4)

  fs.writeFile(csvfile,xls.utils.make_csv(ws),'utf8',(err)->
    if err
      throw err
    else
      console.log 'XLS2CSV saved!'
    )
  callback()

