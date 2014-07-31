# assert = require("assert")
# index_testfile = require("../Index_throw")

# describe 'index_testfile',->
#   it 'specialDataCal',->
#     # arrange
#     actual_start = new Date("Thu Feb 13 2014 09:48:03 GMT-0800 (PST)")
#     actual_stop = new Date("Thu Feb 13 2014 21:48:03 GMT-0800 (PST)")
#     expect_start = new Date("Thu Feb 13 2014 09:00:00 GMT-0800 (PST)")
#     expect_stop = new Date("Thu Feb 13 2014 18:00:00 GMT-0800 (PST)")
#    	console.log actual_start > expect_start
#     # action
#     result = index_testfile.specialDataCal(actual_start,expect_start,actual_stop,expect_stop)
#     # assert
#     assert.equal result,'S迟--到'
#   it 'specialDataCal',->
#     # arrange
#     actual_start = new Date("2014-02-19 18:39:45")
#     actual_stop = new Date("2014-02-19 18:39:45")
#     expect_start = new Date("2014-02-19 9:00:00")
#     expect_stop = new Date("2014-02-19 18:00:00")
#     # action
#     result = index_testfile.specialDataCal(actual_start,expect_start,actual_stop,expect_stop)
#     # assert
#     assert.equal result,'S没有打卡'
    
