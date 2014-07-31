assert = require 'assert'
Person = require '../Person'
sendEmail = require '../logic/send_mail'

describe 'Person',->
  it 'isDate function test01',->
    person = new Person(["王靖雅","","2014-02-14 09:34:00"],"",{},[], ["王靖雅"],{}) 
    date = new Date("2014-02-14 09:34:00")
    result = person.isDate("2014-02-14 09:34:00")
    assert.deepEqual(result,date)

  it 'isDate function test02',->
    person = new Person(["王靖雅","",""],"",{},[],["王靖雅"],{})
    result = person.isDate("")
    assert.deepEqual(result,null)

  it 'date2count function test',->
    person = new Person(["王靖雅","",""],"",{},[],["王靖雅"],{})
    test_value = person.date2count("16号")
    assert.equal(test_value,"16")

  it 'lookUp function test',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","代康","5511","2014-07","2014-07-05 09:26:36","2014-07-05 21:00:36"]
    person = new Person(row,head,{},[],["代康"],[],{"代康":"kang.dai@baidao.com "},"01","31","2014-07")
    test_value = person.lookUp("代康")
    assert.equal(test_value,"kang.dai@baidao.com ")
                    
  it 'timeModule function test1',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","代康","5511","2014-07","2014-07-05 09:26:36","2014-07-05 21:00:36"]
    person = new Person(row,head,{},[],["代康"],[],{"银天下科技技术中心-代康":"kang.dai@baidao.com "},"01","31","2014-07")
    test_value = person.timeModule("2014-07-05 09:26:36")
    assert.equal(test_value,"09:26:36")

  it 'timeModule function test2',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","代康","5511","2014-07","",""]
    person = new Person(row,head,{},[],["代康"],[],{"银天下科技技术中心-代康":"kang.dai@baidao.com "},"01","31","2014-07")
    test_value = person.timeModule()
    assert.equal(test_value,"没有打卡")

  it 'getDate function test',->
    person = new Person(["王靖雅","","","2014-03-15 09:34:00","2014-03-15 18:59:00"],"",{},[],["王靖雅"],{})
    test_value = person.getDate("2014-03-15 09:34:00",10,12,34)
    time = new Date("2014-03-15 10:12:34")
    assert.deepEqual(test_value,time)


  it 'person in LeadList',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","黄冠","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},["黄冠"],[],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "},"01","31","2014-07")
    person.Process()
    kindValue = person.personKind()
    assert.equal(kindValue,1)

  it 'person in MobileDevelopList',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},["黄冠"],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    kindValue = person.personKind()
    assert.equal(kindValue,3)

  it 'person in SpecialDepartmentList',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","路运堤","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{"路运堤"},["黄冠"],["王靖雅"],[],{"银天下科技技术中心-路运堤":"yunti.lu@baidao.com "},"01","31","2014-07")
    person.Process()
    kindValue = person.personKind()
    assert.equal(kindValue,2)

  it 'personkind test',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","马晓阳","5511","2014-07","2014-07-05 09:26:36","2014-07-05 21:00:36","2014-07-06 09:26:36","2014-07-06 18:00:36"]
    person = new Person(row,head,{},[],[],["马晓阳"],{"银天下科技技术中心-马晓阳":"xiaoyang.ma@baidao.com "},"01","31","2014-07")
    person.Process()
    result = person.sendEmail(person)
    assert.equal(result,"presidents")

  it 'isWeekend function test',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: new Date("2014-07-05 10:10:26"),
    offwork: new Date("2014-07-05 10:10:26"),
    onwork_string: '10:10:26',
    offwork_string: '10:10:26'}
    person.days.push(days)
    # console.log person.days[0].date
    result = person.isWeekend(0)
    assert.equal(result,0)

  it 'isWeekend function test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 10:10:26"),
    offwork: new Date("2014-07-01 10:10:26"),
    onwork_string: '10:10:26',
    offwork_string: '10:10:26'}
    person.days.push(days)
    # console.log person.days[0].date
    result = person.isWeekend(0)
    assert.equal(result,2)
  
  it 'dataCal function test1',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:26:36"),
    offwork: new Date("2014-07-01 09:26:36"),
    onwork_string: '10:10:26',
    offwork_string: '10:10:26'}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"没有打卡")

  it 'dataCal function test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:26:36"),
    offwork: new Date("2014-07-01 18:26:36"),
    onwork_string: '09:26:36',
    offwork_string: '18:26:36'}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"出勤正常")

  it 'dataCal function test3',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: new Date("2014-07-05 10:10:26"),
    offwork: new Date("2014-07-05 10:10:26"),
    onwork_string: '10:10:26',
    offwork_string: '10:10:26'}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"出勤正常")#周末的原因


  it 'dataCal function test4',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 10:10:26","2014-07-01 10:10:26","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 10:10:26"),
    offwork: new Date("2014-07-01 10:10:26"),
    onwork_string: '10:10:26',
    offwork_string: '10:10:26'}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"迟到,忘记打卡")

  it 'dataCal function test5',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 10:10:26","2014-07-01 15:10:26","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 10:10:26"),
    offwork: new Date("2014-07-01 15:10:26"),
    onwork_string: '10:10:26',
    offwork_string: '15:10:26'}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"迟  到")

  it 'dataCal function test6',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:10:26","2014-07-01 15:10:26","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:10:26"),
    offwork: new Date("2014-07-01 15:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '15:10:26'}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"早  退")


  it 'dataCal function test7',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","","","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: '',
    offwork: '',
    onwork_string: null,
    offwork_string: null}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0]
    assert.equal(result,"考勤异常")

  it 'dataCal function test3',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: new Date("2014-07-06 10:10:26"),
    offwork: new Date("2014-07-06 10:10:26"),
    onwork_string: '10:10:26',
    offwork_string: '10:10:26'}
    person.days.push(days)
    result = person.dataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"出勤正常")#周末的原因

  it 'leaderDataCal function test01',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","黄冠","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{"路运堤"},["黄冠"],["王靖雅"],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:26:36"),
    offwork: new Date("2014-07-01 09:26:36"),
    onwork_string: "09:26:36",
    offwork_string: "09:26:36"}
    person.days.push(days)
    result = person.leaderDataCal(0)
    # console.log person.days[0]
    assert.equal(result,"考勤异常")

  it 'leaderDataCal function test02',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","黄冠","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{"路运堤"},["黄冠"],["王靖雅"],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: '',
    offwork: '',
    onwork_string: null,
    offwork_string: null}
    person.days.push(days)
    result = person.leaderDataCal(0)
    # console.log person.days[0]
    assert.equal(result,"没有打卡")

  it 'leaderDataCal function test3',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","黄冠","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{"路运堤"},["黄冠"],["王靖雅"],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: '',
    offwork: '',
    onwork_string: null,
    offwork_string: null}
    person.days.push(days)
    result = person.leaderDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"出勤正常")#周末的原因

  it 'leaderDataCal function test4',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","黄冠","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{"路运堤"},["黄冠"],["王靖雅"],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:26:36"),
    offwork: new Date("2014-07-01 18:26:36"),
    onwork_string: "09:26:36",
    offwork_string: "18:26:36"}
    person.days.push(days)
    result = person.leaderDataCal(0)
    # console.log person.days[0]
    assert.equal(result,"出勤正常")



  it 'Overtime function test1',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:10:26","2014-07-01 21:10:26","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:10:26"),
    offwork: new Date("2014-07-01 21:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '21:10:26'}
    person.days.push(days)
    result = person.overtimeDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"3")

  it 'Overtime function test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:10:26","2014-07-01 21:10:26","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:10:26"),
    offwork: new Date("2014-07-01 21:00:26"),
    onwork_string: '09:10:26',
    offwork_string: '21:10:26'}
    person.days.push(days)
    result = person.overtimeDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"2.5")

  it 'Overtime function test3',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:10:26","2014-07-01 21:10:26","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 08:10:26"),
    offwork: new Date("2014-07-01 21:00:26"),
    onwork_string: '08:10:26',
    offwork_string: '21:10:26'}
    person.days.push(days)
    result = person.overtimeDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"3")

  it 'Weekend OVertime function test1',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","","","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: new Date("2014-07-05 09:10:26"),
    offwork: new Date("2014-07-05 13:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '13:10:26'}
    person.days.push(days)
    result = person.overtimeDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,4)#周末的原因

  it 'Weekend OVertime function test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","","","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: new Date("2014-07-05 09:40:26"),
    offwork: new Date("2014-07-05 13:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '13:10:26'}
    person.days.push(days)
    result = person.overtimeDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,3.5)#周末的原因

  it 'getTimeDiff function test1',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","代康","5511","2014-07","2014-07-05 09:26:36","2014-07-05 21:00:36"]
    person = new Person(row,head,{},[],["代康"],[],{"银天下科技技术中心-代康":"kang.dai@baidao.com "},"01","31","2014-07")
    test_value = person.getTimeDiff("2014-07-05 09:26:36","2014-07-05 21:26:36",'hh')
    assert.equal(test_value,12)

  it 'getTimeDiff function test2',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","代康","5511","2014-07","2014-07-05 09:26:36","2014-07-05 21:00:36"]
    person = new Person(row,head,{},[],["代康"],[],{"银天下科技技术中心-代康":"kang.dai@baidao.com "},"01","31","2014-07")
    test_value = person.getTimeDiff("2014-07-05 09:26:36","2014-07-05 09:26:36",'dd')
    assert.equal(test_value,0)

  it 'getTimeDiff function test3',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","代康","5511","2014-07","2014-07-05 09:26:36","2014-07-05 21:00:36"]
    person = new Person(row,head,{},[],["代康"],[],{"银天下科技技术中心-代康":"kang.dai@baidao.com "},"01","31","2014-07")
    test_value = person.getTimeDiff("2014-07-05 09:26:36","2014-07-05 09:36:36",'mm')
    assert.equal(test_value,10)

  it 'getTimeDiff function test4',->
    head = ["基本信息","","","","","",""]
    row = ["5511","移动研发部","代康","5511","2014-07","2014-07-05 09:26:36","2014-07-05 21:00:36"]
    person = new Person(row,head,{},[],["代康"],[],{"银天下科技技术中心-代康":"kang.dai@baidao.com "},"01","31","2014-07")
    test_value = person.getTimeDiff("2014-07-05 09:26:36","2014-07-05 09:36:36",'ss')
    assert.equal(test_value,600)

  it 'sendEmail test',->
    message = {
      from: "<chuchu.lu@baidao.com>"
      subject: "Nodemailer is unicode friendly ✔",
      text: "plaintext alternative",
      html: '<p><b>Hello</b> to self~</p>'
      to : 'jingya.wang@baidao.com'
    }
    sendEmail.sendMail(message)

  it 'specialDutyDataCal function test1',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","运维部","洪润泽","5511","2014-07","2014-07-01 12:26:36","2014-07-01 21:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{'孔祥猛': '运维部','洪润泽': '运维部'},[],["洪润泽"],[],{"银天下科技技术中心-洪润泽":"runze.hong@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 12:26:36"),
    offwork: new Date("2014-07-01 21:26:36"),
    onwork_string: '12:26:36',
    offwork_string: '21:26:36'}
    person.days.push(days)
    result = person.specialDutyDataCal(0)
    assert.equal(result,"早  退")

  it 'specialDutyDataCal function test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","运维部","洪润泽","5511","2014-07","2014-07-01 09:26:36","2014-07-01 21:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{'孔祥猛': '运维部','洪润泽': '运维部'},[],["洪润泽"],[],{"银天下科技技术中心-洪润泽":"runze.hong@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:26:36"),
    offwork: new Date("2014-07-01 21:26:36"),
    onwork_string: '09:26:36',
    offwork_string: '21:26:36'}
    person.days.push(days)
    result = person.specialDutyDataCal(0)
    assert.equal(result,"迟  到")

  it 'specialDutyDataCal function test3',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","内容部","卜乐","5511","2014-07","2014-07-01 09:00:59","2014-07-01 09:00:59","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{'卜乐': '内容部'},[],["卜乐"],[],{"银天下科技技术中心-卜乐":"runze.hong@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 09:00:59"),
    offwork: new Date("2014-07-01 09:00:59"),
    onwork_string: '09:00:59',
    offwork_string: '09:00:59'}
    person.days.push(days)
    result = person.specialDutyDataCal(0)
    assert.equal(result,"没有打卡")

  it 'specialDutyDataCal function test4',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","内容部","卜乐","5511","2014-07","2014-07-01 11:00:59","2014-07-01 18:00:59","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{'卜乐': '内容部'},[],["卜乐"],[],{"银天下科技技术中心-卜乐":"runze.hong@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: new Date("2014-07-01 11:00:59"),
    offwork: new Date("2014-07-01 18:00:59"),
    onwork_string: '11:00:59',
    offwork_string: '18:00:59'}
    person.days.push(days)
    result = person.specialDutyDataCal(0)
    assert.equal(result,"出勤正常")

  it 'specialDutyDataCal function test5',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","内容部","卜乐","5511","2014-07","","","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{'卜乐': '内容部'},[],["卜乐"],[],{"银天下科技技术中心-卜乐":"runze.hong@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '1号',
    onwork: '',
    offwork: '',
    onwork_string: '',
    offwork_string: ''}
    person.days.push(days)
    result = person.specialDutyDataCal(0)
    assert.equal(result,"考勤异常")

  it 'specialDutyDataCal function test6',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","内容部","卜乐","5511","2014-07","2014-07-01 11:20:59","2014-07-01 11:20:59","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{'卜乐': '内容部'},[],["卜乐"],[],{"银天下科技技术中心-卜乐":"runze.hong@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: new Date("2014-07-05 09:40:26"),
    offwork: new Date("2014-07-05 13:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '13:10:26'}
    person.days.push(days)
    result = person.specialDutyDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"出勤正常")#周末的原因

  it 'specialDutyDataCal function test7',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","内容部","杨若维","5511","2014-07","2014-07-01 11:20:59","2014-07-01 11:20:59","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{'杨若维': '内容部'},[],["杨若维"],[],{"银天下科技技术中心-杨若维":"runze.hong@baidao.com "},"01","31","2014-07")
    person.Process()
    days =   { date: '5号',
    onwork: new Date("2014-08-02 09:40:26"),
    offwork: new Date("2014-08-02 13:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '13:10:26'}
    person.days.push(days)
    result = person.specialDutyDataCal(0)
    # console.log person.days[0].onwork
    assert.equal(result,"出勤正常")#周末的原因

  it 'weekDay value function test',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 09:26:36","2014-07-02 09:26:36","2014-07-02 18:00:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"2","22","2014-07",'normal')  
    days =   { date: '6号',
    onwork: new Date("2014-07-06 10:10:26"),
    offwork: new Date("2014-07-06 10:10:26"),
    onwork_string: '10:10:26',
    offwork_string: '10:10:26',
    weekDay : 0}
    person.Process()
    person.days.push(days)
    result = person.isWeekend(0)
    value = person.days[0].weekDay
    assert.equal(value,"日")

  # describe '张勤和张勤女',->
  #   head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
  #   row = ["5511","运营3部","张勤女","5511","2014-07","2014-07-01 11:20:59","2014-07-01 11:20:59","2014-07-02 09:26:36","2014-07-02 18:00:36"]
  #   person = new Person(row,head,{},[],["张勤女"],[],{"银天下科技技术中心-张勤":"zhang.qin@baidao.com "},"01","31","2014-07")
  #   person.Process() 
  #   days =   { date: '1号',
  #   onwork: new Date("2014-07-05 09:40:26"),
  #   offwork: new Date("2014-07-05 13:10:26"),
  #   onwork_string: '09:10:26',
  #   offwork_string: '13:10:26'}
  #   person.days.push(days)

    # it 'emailAddress function test',->

  it 'sendEmail and templateMode test1',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 18:26:36","2014-07-02 09:26:36","2014-07-02 18:56:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"2","22","2014-07",'normal')  
    days =   { date: '4号',
    onwork: new Date("2014-07-04 09:10:26"),
    offwork: new Date("2014-07-04 19:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '19:10:26',
    weekDay : 5,
    status : "考勤正常"}
    person.Process()
    person.days.push(days)
    value = person.sendEmail()
    # console.log value

  it 'sendEmail and templateMode test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-01 09:26:36","2014-07-01 18:26:36","2014-07-02 09:26:36","2014-07-02 18:56:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"2","22","2014-07",'print')  
    days =   { date: '4号',
    onwork: new Date("2014-07-04 09:10:26"),
    offwork: new Date("2014-07-04 19:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '19:10:26',
    weekDay : 5,
    status : "考勤正常"}
    person.Process()
    person.days.push(days)
    value = person.sendEmail()


  it 'sendEmail and templateMode test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-04 09:10:26","2014-07-04 20:10:26","2014-07-02 09:26:36","2014-07-02 18:56:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"2","22","2014-07",'print')  
    days =   { date: '4号',
    onwork: new Date("2014-07-04 09:10:26"),
    offwork: new Date("2014-07-04 20:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '20:10:26',
    weekDay : 5,
    status : "考勤正常",
    overtime: 1}
    person.Process()
    person.days.push(days)
    value = person.overtimeSendEmail()
    # console.log value


  it 'sendEmail and templateMode test2',->
    head = ["基本信息","","","","","","1号","","2号","","3号","","4号",""]
    row = ["5511","移动研发部","王靖雅","5511","2014-07","2014-07-04 09:10:26","2014-07-04 20:10:26","2014-07-02 09:26:36","2014-07-02 18:56:36"]
    person = new Person(row,head,{},[],["王靖雅"],[],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "},"2","22","2014-07",'normal')  
    days =   { date: '4号',
    onwork: new Date("2014-07-04 09:10:26"),
    offwork: new Date("2014-07-04 20:10:26"),
    onwork_string: '09:10:26',
    offwork_string: '20:10:26',
    weekDay : 5,
    status : "考勤正常",
    overtime: 1}
    person.Process()
    person.days.push(days)
    value = person.overtimeSendEmail()
    
      
      
















