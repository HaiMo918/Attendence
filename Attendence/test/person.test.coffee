# assert = require 'assert'
# Person = require '../Person'
# # handle_filedata = require '../handle_filedata'

# describe 'Person',->
#   # describe 'personKind',->
#     # it 'should return type 1 if person in LeadList',->
#     #   person = new Person("黄冠","","", {}, ["黄冠"], []) 
#     #   kindValue = person.personKind("黄冠")
#     #   assert.equal(kindValue,1)

#   it 'isDate function test01',->
#     person = new Person(["王靖雅","","2014-02-14 09:34:00"],"",{},[], ["王靖雅"],{}) 
#     date = new Date("2014-02-14 09:34:00")
#     result = person.isDate("2014-02-14 09:34:00")
#     assert.deepEqual(result,date)

#   it 'isDate function test02',->
#     person = new Person(["王靖雅","",""],"",{},[],["王靖雅"],{})
#     result = person.isDate("")
#     assert.deepEqual(result,null)

#   it 'date2count function test',->
#     person = new Person(["王靖雅","",""],"",{},[],["王靖雅"],{})
#     test_value = person.date2count("16号")
#     assert.equal(test_value,"16")

#   it 'lookUp function test',->
#     person = new Person(["王靖雅","",""],"",{},[],["王靖雅"],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "})
#     test_value = person.lookUp("王靖雅")
#     assert.equal(test_value,"jingya.wang@baidao.com ")


#   it 'getDate function test',->
#     person = new Person(["王靖雅","","","2014-03-15 09:34:00","2014-03-15 18:59:00"],"",{},[],["王靖雅"],{})
#     test_value = person.getDate("2014-03-15 09:34:00",10,12,34)
#     time = new Date("2014-03-15 10:12:34")
#     assert.deepEqual(test_value,time)
 
#   it 'late day',->
#     head = ["基本信息","","","","","18号"]
#     row = ["5511","移动研发部","王靖雅","5511","2014-02","2014-02-18 09:36:36","2014-02-18 20:34:25"]
#     person = new Person(row,head,{},[],["王靖雅"],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     overtime_result = person.days[0].overtime
#     assert.equal(result,"迟  到")
#     assert.equal(overtime_result,"1.5")

#   it 'mobile department overtime day',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","2014-02-18 08:56:36","2014-02-18 20:29:25"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].overtime
#     assert.equal(result,"2")

#   it 'mobile department absent day',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","",""]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"考勤异常")

#   it 'mobile department forget card day01',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","2014-02-18 09:56:36","2014-02-18 09:56:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟到,忘记打卡")

#   it 'mobile department forget card day==02',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","2014-02-18 08:56:36","2014-02-18 08:56:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     # console.log "----------"
#     # console.log person.days[0]
#     # console.log "----------"
#     assert.equal(result,"没有打卡")

#   it 'mobile department late day',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","2014-02-18 09:56:36","2014-02-18 18:56:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟  到")

#   it 'mobile department early offwork',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","2014-02-18 09:26:36","2014-02-18 18:16:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"早  退")

#   it 'mobile department late offwork',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","2014-02-18 09:46:36","2014-02-18 18:16:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟  到")

#   it 'mobile department late offwork',->
#     head = ["基本信息","","","","","20号"]
#     row = ["5511","移动研发部","代康","5511","2014-02","2014-02-18 09:26:36","2014-02-18 18:26:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"出勤正常")

#   it 'leader attendence',->
#     head = ["基本信息","","","","","18号"]
#     row = ["5511","技术中心","黄冠","5511","2014-02","2014-02-18 09:36:36","2014-02-18 20:34:25"]
#     person = new Person(row,head,{},["黄冠"],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"出勤正常")

#   it 'leader attendence',->
#     head = ["基本信息","","","","","18号"]
#     row = ["5511","技术中心","黄冠","5511","2014-02","",""]
#     person = new Person(row,head,{},["黄冠"],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"没有打卡")

#   it 'leader attendence',->
#     head = ["基本信息","","","","","18号"]
#     row = ["5511","技术中心","黄冠","5511","2014-02","2014-02-18 10:36:36","2014-02-18 10:36:36"]
#     person = new Person(row,head,{},["黄冠"],[],{"银天下科技技术中心-黄冠":"guan.huang@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"考勤异常")

#   # it 'Special day timelist01',->
#   #   head = ["基本信息","","","","","6号"]
#   #   row = ["5511","客服部","任中洁","5511","2014-02","2014-02-06 09:26:36","2014-02-06 18:24:25"]
#   #   person = new Person(row,head,{"任中洁":["","","","","","","","","","","13:00:00","21:30:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#   #   person.Process()
#   #   result = person.days[0].status
#   #   console.log person.days

#   #   assert.equal(result,"早  退")

#   it 'Special day timelist02',->
#     head = ["基本信息","","","","","6号"]
#     row = ["5511","客服部","任中洁","5511","2014-02","2014-02-06 13:00:01","2014-02-06 21:34:25"]
#     person = new Person(row,head,{"任中洁":["","","","","","","","","","","13:00:00","21:30:00","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟  到")

#   it 'Special day timelist03',->
#     head = ["基本信息","","","","","6号"]
#     row = ["5511","客服部","任中洁","5511","2014-02","2014-02-06 08:00:01","2014-02-06 21:34:25"]
#     person = new Person(row,head,{"任中洁":["","","","","","","","","","","08:00:00","21:30:00","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟  到")

#   it 'Special day timelist04',->
#     head = ["基本信息","","","","","7号"]
#     row = ["5511","客服部","任中洁","5511","2014-02","",""]
#     person = new Person(row,head,{"任中洁":["","","","","","","","","","","","","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"考勤异常")

#   # it 'Special day timelist05',->
#   #   head = ["基本信息","","","","","7号"]
#   #   row = ["5511","客服部","任中洁","5511","2014-02","2014-02-07 09:36:36","2014-02-07 09:36:36"]
#   #   person = new Person(row,head,{"任中洁":["","","","","","","","","","","","","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#   #   person.Process()
#   #   result = person.days[0].status
#   #   assert.equal(result,"迟到,忘记打卡")

#   it 'Special day timelist03timelist06',->
#     head = ["基本信息","","","","","7号"]
#     row = ["5511","客服部","任中洁","5511","2014-02","2014-02-07 08:36:36","2014-02-07 08:36:36"]
#     person = new Person(row,head,{"任中洁":["","","","","","","","","","","","","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"没有打卡")

#   # it 'Special day timelist07',->
#   #   head = ["基本信息","","","","","7号"]
#   #   row = ["5511","客服部","任中洁","5511","2014-02","2014-02-07 08:56:36","2014-02-07 17:36:36"]
#   #   person = new Person(row,head,{"任中洁":["","","","","","","","","","","","","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#   #   person.Process()
#   #   result = person.days[0].status
#   #   assert.equal(result,"早  退")


#   # it 'Special day timelist08',->
#   #   head = ["基本信息","","","","","7号",""]
#   #   row = ["5511","客服部","任中洁","5511","2014-02","2014-02-07 08:56:36","2014-02-07 18:36:36"]
#   #   person = new Person(row,head,{"任中洁":["","","","","","","","","","","","","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#   #   person.Process()
#   #   result = person.days[0].status
#   #   assert.equal(result,"出勤正常")

#   it 'Special day timelist09',->
#     head = ["基本信息","","","","","6号"]
#     row = ["5511","客服部","任中洁","5511","2014-02","2014-02-06 09:36:36","2014-02-06 18:26:25"]
#     person = new Person(row,head,{"任中洁":["","","","","","","","","","","","","",""]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟  到")

#   it 'Special day timelist09',->
#     head = ["基本信息","","","","","6号"]
#     row = ["5511","客服部","任中洁","5511","2014-02","",""]
#     person = new Person(row,head,{"任中洁":["","","","","","","","","","","","","09:00:00","18:00:00"]},[],[],{"银天下科技-任中洁":"zhongjie.ren@baidao.com "})
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"考勤异常")

#   it 'normal day01',->
#     head = ["基本信息","","","","","17号"]
#     row = ["5511","产品部","胡梦","5511","2014-02","2014-02-17 09:26:36","2014-02-17 18:34:25"]
#     person = new Person(row,head,{},[],[],{"银天下科技技术中心-胡梦":"meng.hu@baidao.com "})
    
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"出勤正常")


#   it 'normal day02',->
#     head = ["基本信息","","","","","17号"]
#     row = ["5511","产品部","胡梦","5511","2014-02","2014-02-17 09:36:36","2014-02-17 18:34:25"]
#     person = new Person(row,head,{},[],[],{"银天下科技技术中心-胡梦":"meng.hu@baidao.com "})
    
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟  到")

#   it 'normal day03',->
#     head = ["基本信息","","","","","17号"]
#     row = ["5511","产品部","胡梦","5511","2014-02","2014-02-17 09:26:36","2014-02-17 18:15:25"]
#     person = new Person(row,head,{},[],[],{"银天下科技技术中心-胡梦":"meng.hu@baidao.com "})
    
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"早  退")

#   it 'normal day04',->
#     head = ["基本信息","","","","","17号"]
#     row = ["5511","产品部","胡梦","5511","2014-02","",""]
#     person = new Person(row,head,{},[],[],{"银天下科技技术中心-胡梦":"meng.hu@baidao.com "})
    
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"考勤异常")

#   it 'normal day05',->
#     head = ["基本信息","","","","","17号"]
#     row = ["5511","产品部","胡梦","5511","2014-02","2014-02-17 09:26:36","2014-02-17 09:26:36"]
#     person = new Person(row,head,{},[],[],{"银天下科技技术中心-胡梦":"meng.hu@baidao.com "})
    
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"没有打卡")


#   it 'normal day06',->
#     head = ["基本信息","","","","","17号"]
#     row = ["5511","产品部","胡梦","5511","2014-02","2014-02-17 09:36:36","2014-02-17 09:36:36"]
#     person = new Person(row,head,{},[],[],{"银天下科技技术中心-胡梦":"meng.hu@baidao.com "})
    
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟到,忘记打卡")


#   it 'normal day07',->
#     head = ["基本信息","","","","","17号"]
#     row = ["5511","产品部","胡梦","5511","2014-02","2014-02-17 09:36:36","2014-02-17 09:36:36"]
#     person = new Person(row,head,{},[],[],{"银天下科技技术中心-胡梦":"meng.hu@baidao.com "})
    
#     person.Process()
#     result = person.days[0].status
#     assert.equal(result,"迟到,忘记打卡")

#   it 'sendEmailModeSelected function01',->
#     head = ["基本信息","","","","","18号"]
#     row = ["5511","移动研发部","王靖雅","5511","2014-02","2014-02-18 09:36:36","2014-02-18 20:34:25"]
#     person = new Person(row,head,{},[],["王靖雅"],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "})
#     person.sendEmailModeSelected(false,true,false)
    

#   it 'sendEmailModeSelected function02',->
#     head = ["基本信息","","","","","18号"]
#     row = ["5511","移动研发部","王靖雅","5511","2014-02","2014-02-18 09:36:36","2014-02-18 20:34:25"]
#     person = new Person(row,head,{},[],["王靖雅"],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "})
#     person.sendEmailModeSelected(true,true,true)

#   it 'sendEmailModeSelected function03',->
#     head = ["基本信息","","","","","18号"]
#     row = ["5511","移动研发部","王靖雅","5511","2014-02","2014-02-18 09:36:36","2014-02-18 20:34:25"]
#     person = new Person(row,head,{},[],["王靖雅"],{"银天下科技技术中心-王靖雅":"jingya.wang@baidao.com "})
#     person.sendEmailModeSelected(true,false,false)


#   it 'mobile department late offwork',->
#     head = ["基本信息","","","","","",""]
#     row = ["5511","移动研发部","代康","5511","2014-03","2014-03-15 09:26:36","2014-03-15 18:26:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     console.log person.OvertimeWeekend
#     # assert.equal()
#     # assert.equal(result,"出勤正常")

#   it 'mobile department late offwork',->
#     head = ["基本信息","","","","","",""]
#     row = ["5511","移动研发部","代康","5511","2014-03","2014-03-15 09:26:36","2014-03-15 18:00:36"]
#     person = new Person(row,head,{},[],["代康"],{"银天下科技技术中心-代康":"kang.dai@baidao.com "})
#     person.Process()
#     console.log person.OvertimeWeekend



 









