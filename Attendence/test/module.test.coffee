# assert = require("assert")
# index_file = require ("../index_module")

# describe 'index_module',->
#   it 'specialDataCal',->
#     actual_start = new Date("2014-02-19 12:39:45")
#     actual_stop = new Date("2014-02-19 21:47:23")
#     expect_start = new Date("2014-02-19 9:00:00")
#     expect_stop = new Date("2014-02-19 18:00:00")
#     # result = index_file.putoutReason(day,name,3,actual_start,actual_stop,expect_start,expect_stop)
#     result = index_file.specialDataCal(actual_start,expect_start,actual_stop,expect_stop)
#     assert.equal(result,"迟  到")

#   it 'specialDataCal',->
#   	actual_start = new Date("2014-02-19 12:33:18")
#   	actual_stop = new Date("2014-02-19 21:30:11")
#   	expect_start = new Date("2014-02-19 13:00:00")
#   	expect_stop = new Date("2014-02-19 21:30:00")
#   	result = index_file.specialDataCal(actual_start,expect_start,actual_stop,expect_stop)
#   	assert.equal(result,undefined)

#   it 'specialDataCal',-> 	
#   	actual_start = new Date("2014-02-19 13:33:18")
#   	actual_stop = new Date("2014-02-19 21:30:11")
#   	expect_start = new Date("2014-02-19 13:00:00")
#   	expect_stop = new Date("2014-02-19 21:30:00")
#   	result = index_file.specialDataCal(actual_start,expect_start,actual_stop,expect_stop)
#   	assert.equal(result,"迟  到")

#   it 'specialDataCal',-> 	
#   	actual_start = new Date("2014-02-19 08:33:18")
#   	actual_stop = new Date("2014-02-19 17:30:11")
#   	expect_start = new Date("2014-02-19 09:00:00")
#   	expect_stop = new Date("2014-02-19 18:00:00")
#   	result = index_file.specialDataCal(actual_start,expect_start,actual_stop,expect_stop)
#   	assert.equal(result,"早  退")

#   it 'leaderDataCal',->
#   	actual_start = new Date("2014-02-19 10:33:18")
#   	actual_stop = new Date("2014-02-19 20:33:55")
#   	result = index_file.leaderDataCal(actual_start,actual_stop)
#   	assert.equal(result,undefined)

#  	it 'leaderDataCal',->
#  		result = index_file.leaderDataCal("没有打卡","没有打卡")
#  		assert.equal(result,"没有打卡")

#  	it 'leaderDataCal',->
#  		actual_start = new Date("2014-02-19 10:33:45")
#  		actual_stop = new Date("2014-02-19 10:33:45")
#  		result = index_file.leaderDataCal(actual_start,actual_stop)
#  		assert.equal(result,"出勤异常")

#  	it 'lookUp',->
#  		result = index_file.lookUp("王靖雅")
#  		assert.equal(result,"jingya.wang@baidao.com ")

#  	it 'lookUp',->
#  		result = index_file.lookUp("黄冠")
#  		assert.equal(result,"guan.huang@baidao.com ")

#   it 'OvertimeCal',->
#     start = new Date("2014-02-24 09:33:20")
#     stop = new Date("2014-02-24 21:02:30")
#     result = index_file.OvertimeCal(start,stop)
#     assert.equal(result,"加班2小时")

#   it 'OvertimeCal',->
#     start = new Date("2014-02-24 09:00:21")
#     stop = new Date("2014-02-24 21:34:00")
#     result = index_file.OvertimeCal(start,stop)
#     assert.equal(result,"加班3.5小时")
