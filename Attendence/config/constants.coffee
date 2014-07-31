module.exports =
  ten_hours: 10 * 60 * 60 *1000
  nine_hours: 9 * 60 * 60 *1000
  one_hour : 60 * 60 *1000
  # mobileNamesList :['杨鑫诚','代康','曹俊','付鹏宇','何熹','杨裕欣','李侦跃','秦永超','王靖雅','张骏磊','俞永明','崔天泽','武建昌']
  presidentsList : ['马晓阳','才子','徐总','汤新州','周勤','李丰芹']
  AttendenceText : "员工考勤异常情况"
  OvertimeText : "加班情况" 
  userName: "chuchu.lu@baidao.com"
  psw : "13776977538lu"
  attendenceExl : './xlsfiles/AttendenceZhenHua.xls'
  attendenceCsv : './csvfiles/AttendenceZhenHua.csv'
  leadersExl : './xlsfiles/leaders.xls'
  leadersCsv : './csvfiles/leaders.csv'
  # dutyExl : './xlsfiles/DutyTimeTable.xls'
  # dutyCsv : './csvfiles/DutyTimeTable.csv'
  mobileExl : './xlsfiles/MobileList.xls'
  mobileCsv : './csvfiles/MobileList.csv'
  specialListExl : './xlsfiles/SpecialDepartList.xls'
  specialListCsv : './csvfiles/SpecialDepartList.csv'
  
  emailList01: '/csvfiles/emailList01.csv'
  attendenceCsvPath : '/csvfiles/AttendenceZhenHua.csv'
  leadersCsvPath : '/csvfiles/leaders.csv'
  mobileCsvPath : '/csvfiles/MobileList.csv'
  emailAddressCsv : './csvfiles/EmailAddress.csv'
  emailList01Csv : './csvfiles/emailList01.csv'
  # dutyTimeTableCsv : '../csvfiles/DutyTimeTable.csv'
  specialMapCsv : '../csvfiles/SpecialDepartList.csv'

  transportOptions :{
    service: "Baidao",
    auth:{
      user: "chuchu.lu@baidao.com",
      pass: "13776977538lu"
    }
  }
  message :{
    from: "<chuchu.lu@baidao.com>"
  }
  specialDepartDuty : {
    '运维部' : [['09:01:00','18:00:00'],['13:01:00','21:30:00']],
    '运营部' : [['09:01:00','18:30:00'],['11:01:00','20:00:00'],['12:31:00','21:30:00']],
    '内容部': [['13:01:00','21:30:00'],['11:01:00','18:00:00']],
    '产品2部' : [['08:31:00','17:30:00']]
  }

  sameNameList :{
    'zhang.qin@baidao.com' : "张勤女"
  }
  #ops,operation,content,product2
  