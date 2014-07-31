handlebars = require('handlebars')


exports.dutyListHtml = dutyListHtml = '''
      <div>
        <p>考勤时间:{{YearAndMon}}月 : {{startDay}}-{{deadlineDay}}</p>
        {{#each attendance}}
        <table frame=\"box\" rules=\"all\" width=\"756px\"style=\"table-layout:fixed;border:4px double;padding:5px\">
          <tr >
            <td colspan=\"4\" height=\"35px\" style=\"text-align:center;font-weight:bold;font-size:20px\">考勤异常情况审批表</td>  
          </tr>
          <tr>
            <td height=\"35px\" style=\"text-align:left;font-size:15px\">姓名:{{name}}</td>
            <td style=\"text-align:left;font-size:15px\">岗位:    </td>
            <td style=\"text-align:left;font-size:15px\">部门:{{department}}</td>
            <td style=\"text-align:left;font-size:15px\">申请日期：    </td>
          </tr>
          <tr>
            <td height=\"35px\" style=\"border-right-style:none;font-size:15px\">
              实际到离岗时间：
            </td>
            
            <td colspan=\"3\" height=\"35px\" style=\"border-left-style:none;letter-spacing:7px;font-size:15px\">
             {{YearAndMon}} 月 {{date}} 日 {{onwork_string}}  时 至  {{YearAndMon}}月 {{date}}  日  {{offwork_string}}  时
            </td>
          </tr>
            <td height=\"35px\" style=\"border-right-style:none;font-size:15px\">
              审批事由：
            </td>
            <td colspan=\"3\" height=\"35px\" style=\"border-left-style:none;letter-spacing:5px;font-size:15px\">
              □因公外出 □未录指纹  □忘记打指纹  □出差   □其它：
            </td>
          <tr>
            <td colspan=\"2\" width=\"30%\" height=\"50px\" style=\"valign=top;text-align:left;font-size:15px\">部门负责人审批：    </td>
            <td width=\"30%\" style=\"valign=top;text-align:left;font-size:15px\">人事部审批：    </td>
            <td width=\"30%\" style=\"valign=top;text-align:left;font-size:15px\">分管副总：       </td>
          </tr>
        </table>
        {{/each}}
        

        <p style = \"font-size:180%;color:red\">如已填表，自行忽略！</p>
        <p style = \"font-size:180%;color:red\">请在邮件发送的3日内提交考勤异常表格，逾期视为事假处理</p>
        <p style = \"font-size:180%;color:red\">友情提示：员工每月前三次10分钟以内的迟到不计扣罚，10分钟以上30分钟以内迟到第一次扣罚20元，第二次罚款40，以此类推</p>
      </div>
      
    '''