handlebars = require('handlebars')


exports.dutyListHtml = dutyListHtml = '''
      <div>
        <h1>Hello,{{name}}</h1>
        <p>您本月的加班情况 ^.^</p>
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
          <tr>             
            <td>加班情况</td>    
            {{#each attendance}}   
              <td>加班{{overtime}}小时</td> 
            {{/each}}          
          </tr>
        </table>
        <p style = \"font-size:180%;color:red\">请各位填写加班单！</p>
      </div>
      
    '''