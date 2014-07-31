handlebars = require('handlebars')


exports.dutyListHtml = dutyListHtml = '''
      <div>
        <h1>Hello,{{name}}</h1>
        <p>您本月的考勤存在异常 ^.^</p>
        <p>所属部门 {{department}}</p>
        <p>考勤时间:{{YearAndMon}}月 : {{startDay}}-{{deadlineDay}}</p>

        <table border=\"1\" frame=\"border\" rules=\"all\">
          <tr>             
            <td>状态日期</td>   
            {{#each attendance}}                     
            <td>{{date}}</td>
            {{/each}}          
          </tr> 
          <tr>             
            <td>上班情况</td>    
            {{#each attendance}}         
            <td>{{onwork_string}}</td>
            {{/each}}          
          </tr>  
          <tr>             
            <td>下班情况</td>    
            {{#each attendance}}         
            <td>{{offwork_string}}</td>
            {{/each}}          
          </tr>
          <tr>             
            <td>考勤状况</td>    
            {{#each attendance}}   
              <td>{{status}}</td> 
            {{/each}}          
          </tr>
        </table>
        <p style = \"font-size:180%;color:red\">如已填表，自行忽略！</p>
        <p style = \"font-size:180%;color:red\">请在邮件发送的3日内提交考勤异常表格，逾期视为事假处理</p>
        <p style = \"font-size:180%;color:red\">友情提示：员工每月前三次10分钟以内的迟到不计扣罚，10分钟以上30分钟以内迟到第一次扣罚20元，第二次罚款40，以此类推</p>
      </div>
      
    '''