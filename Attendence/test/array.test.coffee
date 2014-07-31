# assert = require 'assert'

# describe 'Array JavaScript1.6 test',->
#   it 'filter function ',->
#     array = [1,2,3,4,5]
#     abc = array.filter (day)->day > 3 
#     console.log abc
  
#   it 'filter function ',->
#     array = ['jingya',2,4,'ruanshizi','yuki',1,3,'Surpery',0]
#     abc = array.filter (day)-> !(day % 2)
#     console.log abc


#   it 'every function',->
#     array = [6,7,8,9,10]
#     abc = array.every (day)-> day in [6,7,8,9,10]
#     console.log abc

#   it 'some function',->
#     array = [1,2,3,4,5,6]
#     abc = array.some (day)-> day in [0]
#     console.log abc
  
#   it 'forEach function？？',->
#     array = [1,2,3,'yuki','jingya','Surpery']
#     abc = array.forEach (index)-> console.log index
#     # console.log abc

#   it 'map function',->
#     array = [1,2,3,'yuki','jingya','Surpery']
#     abc = array.map (value)-> -value 
#     console.log abc

#   it 'indexOf function',->
#     array = [1,'jingya',3,4,'yuki',6,7]
#     abc = array.indexOf(0)
#     console.log abc

#   it 'lastIndexOf function ',->
#     array = [1,2,3,'yuki','dd','huang','jingya','Surpery']
#     abc = array.lastIndexOf('yuki',3)
#     console.log abc

#   it 'map test function',->
#     array = [1,2,3,4,5,6,7,8]
#     abc = array.filter (value) -> not (value%2)
#     # arrayNew = abc.map (value) -> value/=2
#     arrayNew = abc.map (value) -> value >> 1
#     console.log arrayNew

