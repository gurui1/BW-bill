<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>账单模板</title>
    <style lang="less" scoped>
        body {
            width: 210mm;
            /* A4 paper width */
            height: 0;
            /* A4 paper height */
            margin: 0;
            padding: 0;
        }

        #app {
            width: 100%;
            min-height: 1122.52px;
            height: auto;
            position: relative;
        }

        .bottom {
            height: 140px;
            width: 793px;
            font-size: 15.5px;
            font-weight: bold;
            letter-spacing: 2px;
            /* position: absolute;
            bottom: 0;*/
        }

        .left1 {
            display: inline-block;
            width: 400px;
            margin-left: 35px;
        }

        .right1 {
            display: inline-block;
            width: 230px;
            margin-left: 80px;

        }

       
        .table3 {
            margin-left: 15px;
            margin-right: 15px;
            height: 750px;
        }

        .heji {
            position: relative;
            left: 460px;
            /* // background-color: black; */
            width: 330px;
            height: 60px;
            font-size: 15.5px;
            font-weight: bold;
            color: black;
        }

        .heji2 {
            position: relative;
            left: 460px;
            width: 330px;
            height: 60px;
            font-size: 15.5px;
            font-weight: bold;
            color: black;
        }



        .left {
            width: 165px;
            /* // background-color: aqua; */
            display: inline-block;
            font-weight: bold;
            /* padding-left: 50px; */
            /* box-sizing: border-box; */
            letter-spacing: 2px;
            margin-left: 40px;
        }

        .right2 {
            flex: 1;
            /* // background-color: black; */
            display: inline-block;
            font-weight: bold;
            letter-spacing: 2px;
        }

        .table {
            width: 748px;
            border-collapse: collapse !important;
            background-color: transparent;
            margin-left: 15px;
            margin-right: 15px;
            /* z-index: 111; */
            height: auto;
            border-spacing: 10px !important;
        }
        .table2 {
            width: 748px;
            border-collapse: collapse !important;
            background-color: transparent;
            margin-left: 15px;
            margin-right: 15px;
            /* z-index: 111; */
            height: auto;
            border-spacing: 10px !important;
        }

        .table th,
        .table td,.table2 th,
        .table2 td {
            text-align: center;
            padding: 6px 1px;
            border: 1px solid transparent;

        }

        thead {
            background-color: #0053f4;
        }

        .table thead th {
            font-size: 14.4px;
            font-weight: 400;
            color: white;
            /* letter-spacing: 1.5px; */
            background-color: #0053f4;
            padding: 10px 0px;
            width: 100px;
            border: 2px solid #0053f4;
            box-sizing: border-box;
            border-collapse: collapse;
        }
        .table2 thead th {
            font-size: 14.4px;
            font-weight: 400;
            color: white;
            /* letter-spacing: 1.5px; */
            background-color: #0053f4;
            padding: 10px 0px;
            width: 200px;
            border: 2px solid #0053f4;
            box-sizing: border-box;
            border-collapse: collapse;
        }

        .table tbody tr:hover,.table2 tbody tr:hover {
            background-color: transparent;
        }

        .page {
            font-size: 16px;
            width: 240px;
            font-weight: 600;
            letter-spacing: 2px;
            position: relative;
            left: 280px;
        }

        .bg {
            background-color: rgb(255, 255, 255);
            background-image: url('https://s21.ax1x.com/2024/08/16/pACVaI1.png');
            background-position: center;
            background-repeat: no-repeat;
            background-size: 793.69px 1122.5px;
        }
    </style>
</head>
<#assign tmpsize=((tableData?size-16)/24)?int />
<#assign tmpsize2=(tableData?size-16)%24 />

<#if tmpsize2 gt 0>
    <#assign totalPage=tmpsize+2 />
    <#else>
        <#assign totalPage=tmpsize+1 />
</#if>
<#if totalPage==1 && tableData?size gt 13>
    <#assign lasePage=totalPage+1 />
    <#elseif totalPage gt 1 && (tableData?size-16-(totalPage-2)*24) gt 21>
        <#assign lasePage=totalPage+1 />
        <#else>
            <#assign lasePage=totalPage />
</#if>
<#list 1..lasePage as i>
    <#if i<=totalPage>
        <#if i==1>
            <#if tableData?size<17>
                <#assign tmpTable=tableData[0..] />
                <#else>
                    <#assign tmpTable=tableData[0..15] />
            </#if>
            <#elseif (16+(i-1)*24) gt tableData?size-1>
                <#assign tmpTable=tableData[(16+(i-2)*24)..tableData?size-1] />
                <#else>
                    <#assign tmpTable=tableData[(16+(i-2)*24)..(16+(i-1)*24)-1] />
        </#if>
    </#if>

    <body>
        <div id="app">
            <div class="bg" style="height: 1122.5px;">
                <#if i==1>
                    <img src="https://s21.ax1x.com/2024/08/16/pACV3xU.png" alt="" height="180px" width="100%">
                    <div style="height: 110px; padding-top: 10px;box-sizing: border-box;">
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">客户名称: </div>
                            <div class="right2">${check.name}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">费用合计: </div>
                            <div class="right2">${check.total}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 10px;">账期 : </div>
                            <div class="right2">${check.zhangQi}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 10px;">大写金额 : </div>
                            <div class="right2">${check.daXie}</div>
                        </div>
                    </div>
                    <img src="https://s21.ax1x.com/2024/08/16/pACm2dJ.png" alt="" width="100%">
                    <div style="height: 90px;">
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">业务类别: </div>
                            <div class="right2">${check.leBie}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">结算币种: </div>
                            <div class="right2">${check.biZhong}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 10px;">确认日期: </div>
                            <div class="right2">${check.date}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">

                        </div>
                    </div>
                </#if>
                <#if i!=1>
                    <img src="https://s21.ax1x.com/2024/08/16/pACVJr4.png" alt="" width="100%">
                </#if>
                <#if i<=totalPage>
                    <div class="table" style="height: auto">
                        <table>
                            <thead>
                                <tr>
                                    <th >账期</th>
                                    <th>业务账号</th>
                                    <th>国家码</th>
                                    <th>国家/地区</th>
                                    <th>应答话单数</th>
                                    <th>通话时长</br>(秒)</th>
                                    <th>计费时长</br>(秒)</th>
                                    <th style="width: 180px;">单价</br>(分钟,币种)</th>
                                    <th>计费周期</th>
                                    <th>账单金额</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#list tmpTable as row>
                                    <tr>
                                        <#list row as cell>
                                            <td>${cell.value}</td>
                                        </#list>
                                    </tr>
                                </#list>
                            </tbody>
                        </table>
                    </div>
                    <div class="table2" style="height: auto">
                        <table>
                            <thead>
                                <tr >
                                    <th>账期</th>
                                    <th>业务账号</th>
                                    <th>国家码</th>
                                    <th>国家/地区</th>
                                    <th>费用类别</th>
                                    <th>费用金额</br>(币种)</th>
                                    <th>账单金额</th>
                                </tr>
                            </thead>
                            <tbody>
                                <#list tmpTable as row>
                                    <tr>
                                        <#list row as cell>
                                            <td>${cell.value}</td>
                                        </#list>
                                    </tr>
                                </#list>
                            </tbody>
                        </table>
                    </div>
                </#if>
                <#if i==lasePage>
                    <div class="heji">
                        <img src="https://s21.ax1x.com/2024/08/16/pACmRo9.png" alt="" width="">
                        <span style='margin-left: 10px;letter-spacing: 2px;'>合计 : </span>
                        <span style='margin-left: 10px;letter-spacing: 2px;'>${check.total}</span>
                    </div>
                    <div class="bottom">
                        <div class="left1" style="line-height: 30px;">
                            尊敬的合作伙伴，感谢您长期的信任与支持。期待您尽快结算账单款项，以维持我们的良好合作。&nbsp;&nbsp; 祝商祺！
                        </div>
                        <div class="right1">
                            请在此加盖印章
                        </div>
                    </div>
                </#if>


                <div class="page" style="height: 50.5px;position: absolute;bottom: 0;">
                    第${i}页 共${lasePage}页
                </div>

            </div>

        </div>
    </body>

</#list>

</html>