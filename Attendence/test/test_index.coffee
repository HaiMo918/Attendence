# assert = require("assert")
# index_testfile = require("../Index_new")

# describe 'testEmail',->
#   it '#lookUp()',->
#     assert.equal(index_testfile.lookUp('王菲'),'wang.fei@baidao.com')
#     assert.equal(index_testfile.lookUp('王靖雅'),'jingya.wang@baidao.com')
#   it '#readFile()',->
#     console.log index_testfile.map
#     assert.equal index_testfile.map['银天下科技总经办-李丰芹'],'fengqin.li@baidao.com '
#   it '#dataCal()',->
#     start = new Date('2013-12-02 09:05:20')
#     stop = new Date('2013-12-02 18:13:53')
#     assert.equal index_testfile.dataCal(start,stop), null
#   it '#dataCal()',->
#     start = new Date('')
#     stop = new Date('')
#     assert.equal index_testfile.dataCal(null,null), '异常'
#   it '#dataCal()',->
#     start = new Date('2013-12-02 09:35:20')
#     stop = new Date('2013-12-02 18:13:53')
#     assert.equal index_testfile.dataCal(start,stop), '迟到早退'
  


