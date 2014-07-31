handlebars = require('handlebars')


exports.dutyListHtml = dutyListHtml = '''
  <div>
    <p>考勤时间:{{YearAndMon}}月 : {{startDay}}-{{deadlineDay}}</p>
    <table frame=\"box\" rules=\"all\" width=\"756px\" style=\"table-layout:fixed;border:4px double;padding:5px\">
      <tr >
        <td colspan=\"2\" height=\"40px\" style=\"text-align:center;font-weight:bold;font-size:30px;letter-spacing:17px;border-right-style:none\">加班申请单</td>
        <td style=\"border-left-style:none;text-align:left;font-size:15px\">申请日期：</td>  
      </tr>
      <tr>
        <td height=\"40px\" style=\"text-align:left;font-weight:bold;font-size:18px\">申请人：{{name}} </td>
        <td style=\"text-align:left;font-weight:bold;font-size:18px\">部门：{{department}}    </td>
        <td style=\"text-align:left;font-weight:bold;font-size:18px\">岗位：       </td>
      </tr>
      <tr>
        <td rowspan=\"{{length}}\"+\"1\" style=\"border-right-style:none;font-weight:bold;font-size:18px\">
          加班事由及时间
        </td>
      </tr>
      {{#each attendance}}
      <tr>
        <td colspan=\"2\" height=\"100px\" vAlign=\"top\" style=\"font-size:15px\">
          从{{YearAndMon}} 月 {{date}} 日 {{onwork_string}} 时 至 {{YearAndMon}}月 {{date}} 日 {{offwork_string}} 时     止     共{{overtime}}小时     周  {{weekDay}}
          <br>用餐时间：□30分钟 □60分钟</br>
          事由：
        </td>
      </tr>
      {{/each}}
      <tr>
        <td height="40px" style="border-right-style:none;font-size:18px">
          加班后处理：
        </td>
        <td colspan=\"2\" height=\"40px" style="border-left-style:none;font-size:18px">
          □安排调休_________       □计发加班工资_________
        </td>
      </tr>
      <tr>
        <td width=\"30%\" height=\"50px\" style=\"text-align:left;font-size:15px\">部门负责人审批：    </td>
        <td width=\"30%\" style=\"valign=top;text-align:left;font-size:15px\">人事部审批：    </td>
        <td width=\"30%\" style=\"valign=top;text-align:left;font-size:15px\">分管副总审批：       </td>
      </tr>
      <tr>
        <td colspan=\"3\" height=\"100px\" vAlign=\"top\" style=\"font-size:15px\">
          <br style=\"font-size:20px\">温馨提示：</br>
          <br>1.用餐时间以30分钟为一个计算单位，最多不超过60分钟。用餐时间不计加班</br>
          <br>2.加班时间30分钟为一个计算单位，加班时长达60分钟以上开始计算。</br>
          <br>3.审批后的《加班申请表》须在加班当天后3格工作日内报人事部备案，逾期申报视为无效申请</br>
        </td>
      </tr>
    </table>
  </div>
  
'''