moment = require 'moment'
handlebars = require 'handlebars'
normalHandlebars = require('./templates/normalHandlebars')
overtimeHandlebars = require('./templates/overtimeHandlebars')
# MobiDepWkendOvertime = require('./templates/MobiDepWkendOvtime')

attendenceHandlebars = require('./templates/attendenceTable')
overtimeTemplate = require('./templates/overtimeTemplate')

constants = require('./config/constants')
mail = require './logic/send_mail'
AttendenceStatus = require './config/AttendenceStatus'

class Person 
  constructor:(@row,@head,@specialPersonMap,@leaderList,@mobile_Department,@presidents,@map,@startDay,@deadlineDay,@YearAndMon,@tempalteModeKind)->
    @attendence = null   
    @handler = null
    @overtime_handler = null  
    @days = []


  Process: ->
    @dataInit()
    @processData()
    @processOvertime()
    # @processWeekendOvertime()#jy
    @sendEmail()
    @overtimeSendEmail()
    #@sendEmailModeSelected(true,true,true)

  dataInit: ->
    @name = @row[2]
    @department = @row[1]
    @yearMon = @row[4] 

    @personKind()

    for cell,i in @row[5..] by 2 when !!@head[i+5] 

      count = parseInt(@head[i+5].split("号"))

      if count >= @startDay and count <= @deadlineDay

        start = @isDate(@row[5+i])
        stop = @isDate(@row[5+i+1])

        oneday =
          name : @name
          department : @department
          YearAndMon : @YearAndMon
          date : @head[i+5]
          onwork : start
          offwork : stop
          onwork_string :@timeModule(start)
          offwork_string :@timeModule(stop)

        # console.log @days
        @days.push(oneday)
      

  processData :->
    for j in [0...@days.length]
      handler_backvalue = @handler(j)
      @days[j].status = handler_backvalue

    
  processOvertime:->
    for k in [0...@days.length]
      overtime_backvalue = @overtime_handler(k)
      @days[k].overtime = overtime_backvalue

    
  personKind :->
    if @name in @leaderList
      @handler = @leaderDataCal
      @overtime_handler = ->
      return 1

    if @name of @specialPersonMap
      # console.log @specialPersonMap[@name]
      @handler = @specialDutyDataCal
      @overtime_handler = ->
      return 2

    if @name in @mobile_Department
      @handler = @dataCal
      @overtime_handler = @overtimeDataCal
      return 3

    @handler = @dataCal
    @overtime_handler = ->
    # @overtime_handler = @overtimeDataCal#所有部门都计算加班情况
    return 0

  isDate :(rowValue)->
    if !!rowValue
      startValue = new Date(rowValue)
    else
      startValue = null 


  isWeekend : (index)->
    date =  @date2count(@days[index].date)
    yearmon = @YearAndMon.split('-')
    if date < 10
      Day = new Date(yearmon[0]+"/"+yearmon[1]+'/0'+date)
    Day = new Date(yearmon[0]+"/"+yearmon[1]+'/'+date)
    weekDay = Day.getDay()

    if weekDay is 0
      @days[index].weekDay = "日"  
    else
      @days[index].weekDay =  weekDay

    if weekDay is 0 or weekDay is 6
      return 0
    weekDay  

  dataCal : (index) ->

    if not @isWeekend(index) 
      return AttendenceStatus.normal

    start = @days[index].onwork
    stop = @days[index].offwork

    earl = @getDate(start,9,31,0)
    lat = @getDate(stop,18,0,0)

    # console.log "~~~",@days[index].date
    # console.log "---",@days

    if not start or not stop
      return AttendenceStatus.abnormal

    if (start - stop) is 0 and start >= earl and start <= lat
      return AttendenceStatus.lateAndnocard

    if (start - stop) is 0
      return AttendenceStatus.noCard

    if start >= earl
      return AttendenceStatus.late

    if stop <= lat or (stop - start)<constants.nine_hours 
      return AttendenceStatus.earlyOff

    return AttendenceStatus.normal

 
  leaderDataCal : (index) ->
    if not @isWeekend(index)
      return AttendenceStatus.normal

    start = @days[index].onwork
    stop = @days[index].offwork

    if not start or not stop
      return AttendenceStatus.noCard

    if (start - stop) is 0
      return AttendenceStatus.abnormal

    return AttendenceStatus.normal
  

  getTimeDiff : (begin,end,fmat)->
    format = {"ss":1000,"mm":60*1000,"hh":60*60*1000,"dd":60*60*1000*24}
    startdate = Date.parse(begin)
    enddate = Date.parse(end)
    result = (enddate-startdate)/format[fmat];
    result

 
  specialDutyDataCal : (index)->

    if not @isWeekend(index) 
      return AttendenceStatus.normal

    timeArray = constants.specialDepartDuty[@specialPersonMap[@name]]
    start = @days[index].onwork
    stop = @days[index].offwork
    startDate = new Date(start)
    time2YMD = @YearAndMon+"-#{startDate.getDate()} "
    # console.log "~~~",@specialPersonMap

    if not start or not stop
      return AttendenceStatus.abnormal

    if (start - stop) is 0
      return AttendenceStatus.noCard

    if @specialPersonMap[@name] of constants.specialDepartDuty

      timeRangeIndex = @timeRangeCompare(start,timeArray)
      start_spe = new Date(time2YMD + timeArray[timeRangeIndex][0])
      stop_spe = new Date(time2YMD + timeArray[timeRangeIndex][1])

      if start > start_spe
        return AttendenceStatus.late

      if stop < stop_spe
        return AttendenceStatus.earlyOff

      return AttendenceStatus.normal
      

  timeRangeCompare : (start,timeArray)->
    timeRange = []
    for i in [0...timeArray.length] 
      array = timeArray[i]
      time2YMD = @YearAndMon+"-#{start.getDate()} "
      start_spe = new Date(time2YMD + array[0])
      timeDiff = @getTimeDiff(start,start_spe,'mm')

      if timeDiff < 0
        timeRange.push(-timeDiff)
      else 
        timeRange.push(timeDiff)
    indexCompared = timeRange.indexOf(Math.min.apply(Math, timeRange)) 

    return indexCompared
 


  overtimeDataCal : (index)->

    start = @days[index].onwork
    stop = @days[index].offwork
    begin = @getDate(start,9,0,0)
    early = @getDate(start,9,31,0)

    start = begin if start < begin
    overtime = (stop - start - constants.nine_hours)/constants.one_hour

    time_count = parseInt(overtime)
    decimalsnum = overtime - time_count

    weekendTime = (stop - start)/constants.one_hour
    weekend_timeCount = parseInt(weekendTime)
    decimalsnum_weekend = weekendTime - weekend_timeCount

    if not @isWeekend(index) and start
      weekend_timeCount += 0.5 if decimalsnum_weekend >= 0.5
      return weekend_timeCount 

    if overtime > 1
      time_count += 0.5 if decimalsnum >= 0.5

      return time_count

    return 


  date2count :(date)->
    index_count = date.split('号')
    count = parseInt(index_count)
    
    
  getDate : (date,hour,min,second)->
    new_time = new Date(date)
    new_time.setHours hour
    new_time.setMinutes min
    new_time.setSeconds second
    return new_time 


  # lookUp :(key)->   
  #   for dutyMon_name of @map
  #     keystr = dutyMon_name.split("-")
  #     if keystr[1] is key
  #       return @map[dutyMon_name]  
  lookUp :(key)->
    # console.log key
    return @map[key]

  timeModule:(time)->
    if time
      time_string = moment(time).format('HH:mm:ss')
      return time_string
    return AttendenceStatus.noCard


  sendEmail : (person)->
    message = constants.message

    days_abnormal = @days.filter (day)-> day.status isnt AttendenceStatus.normal

    if @name in @presidents 
      return "presidents"

    if days_abnormal.length is 0
      return

    if @tempalteModeKind is "normal"
      dutyHtml = normalHandlebars.dutyListHtml
      template = handlebars.compile(dutyHtml)

      data = {"name":@name,"YearAndMon":@YearAndMon,"startDay":@startDay,"deadlineDay":@deadlineDay,"department":@department,"yearMon": @yearMon,"attendance" : days_abnormal}
      @attendenceResult = template(data)

    if @tempalteModeKind is "print"
      attendenceHtml = attendenceHandlebars.dutyListHtml
      attendenceTemplate = handlebars.compile(attendenceHtml)
      attendenceData = {"name":@name,"YearAndMon":@YearAndMon,"startDay":@startDay,"deadlineDay":@deadlineDay,"department":@department,"yearMon": @yearMon,"attendance" : days_abnormal}
      @attendenceResult = attendenceTemplate(attendenceData)

    message.subject = constants.AttendenceText
    message.to = @lookUp(@name)
    message.html = @attendenceResult
    # mail.sendMail message,(error) ->
    #   if error
    #     console.log "Error occured"
    #     console.log error.message
    #     return
    #   console.log "Message sent successfully!"


  overtimeSendEmail : (person)->

    message = constants.message

    days_overtime = @days.filter (day) -> day.overtime isnt undefined 

    if days_overtime.length is 0
      return 


    if @tempalteModeKind is "normal"
      dutyHtml = overtimeHandlebars.dutyListHtml
      template = handlebars.compile(dutyHtml)
      data = {"name":@name,"YearAndMon":@YearAndMon,"startDay":@startDay,"deadlineDay":@deadlineDay,"department":@department,"yearMon": @yearMon,
      "attendance" : days_overtime}
      @overtimeResult = template(data)

    if @tempalteModeKind is "print"
      dutyHtml = overtimeTemplate.dutyListHtml
      overtimetemplate = handlebars.compile(dutyHtml)
      overtimeData = {"name":@name,"YearAndMon":@YearAndMon,"startDay":@startDay,"deadlineDay":@deadlineDay,"department":@department,"yearMon": @yearMon,
      "attendance" : days_overtime,"length": days_overtime.length+1}
      @overtimeResult = overtimetemplate(overtimeData)

    # if @name is ""
    message.subject = constants.OvertimeText
    message.to = @lookUp(@name)
    message.html = @overtimeResult
    # console.log @overtimeResult
    # console.log @days
    # mail.sendMail message,(error) ->
    #   if error
    #     console.log "Error occured"
    #     console.log error.message
    #     # console.log message.to
    #     return
    #   console.log "Message sent successfully!"


  # sendEmailModeSelected :(isAttendence,isOvertime,isTogether)->
  #   if isTogether
  #     result = @attendenceTable + @overtimeResult 
  #     # mail.sendMail
  #     #   subject:"考勤异常与加班情况"
  #     #   to:@lookUp(@name)
  #     #   html: result

  #   if isAttendence and not isOvertime
  #     result = @attendenceTable 
  #     # mail.sendMail
  #     #   subject:"员工考勤异常情况"
  #     #   to: @lookUp(@name)
  #     #   html: @attendenceResult
  #     #console.log @attendenceResult

  #     # if @name in @mobile_Department     
  #     #   console.log @attendenceResult

  #   if isOvertime and not isAttendence
  #     result = @mobile_Department
  #     # mail.sendMail
  #     #   subject : "员工加班情况"
  #     #   to :@lookUp(@name)
  #     #   html :@overtimeResult
  #     #console.log @overtimeResult
  #     # if @name in @mobile_Department     
  #     #   console.log @overtimeResult

  
module.exports = Person