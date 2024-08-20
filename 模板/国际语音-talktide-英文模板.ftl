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
            width: 794px;
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
            background-color: #f0ae3d;
        }

        .table thead th {
            font-size: 14.4px;
            font-weight: 400;
            color: white;
            /* letter-spacing: 1.5px; */
            background-color: #f0ae3d;
            padding: 10px 0px;
            /* width: 200PX; */
            border: 2px solid #f0ae3d;
            box-sizing: border-box;
            border-collapse: collapse;
        }
        .table2 thead th {
            font-size: 14.4px;
            font-weight: 400;
            color: white;
            /* letter-spacing: 1.5px; */
            background-color: #f0ae3d;
            padding: 10px 0px;
            width: 200px;
            border: 2px solid #f0ae3d;
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
            background-image: url('https://s21.ax1x.com/2024/08/16/pACZpyF.png');
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
                    <img src="https://s21.ax1x.com/2024/08/16/pACVhJP.png" alt="" height="180px" width="100%">
                    <div style="height: 110px; padding-top: 10px;box-sizing: border-box;">
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">Customer Name: </div>
                            <div class="right2">${check.name}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">Total price: </div>
                            <div class="right2">${check.total}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 10px;">Month : </div>
                            <div class="right2">${check.zhangQi}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">

                        </div>
                    </div>
                    <img src="https://s21.ax1x.com/2024/08/16/pACm2dJ.png" alt="" width="100%">
                    <div style="height: 90px;">
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">Product Type: </div>
                            <div class="right2">${check.leBie}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 20px;">Currency: </div>
                            <div class="right2">${check.biZhong}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">
                            <div class="left" style="box-sizing: border-box;padding-top: 10px;">Invoice Date: </div>
                            <div class="right2">${check.date}</div>
                        </div>
                        <div style="display: inline-block;width: 380px;height: 45px;">

                        </div>
                    </div>
                </#if>
                <#if i!=1>
                    <img src="https://s21.ax1x.com/2024/08/16/pACVoQS.png" alt="" width="100%">
                </#if>
                <#if i<=totalPage>
                    <div class="table" style="height: auto">
                        <table>
                            <thead>
                                <tr>
                                    <th style="margin: 100px;">Month</th>
                                    <th>Account</th>
                                    <th>CountryCode</th>
                                    <th>Country</th>
                                    <th>Call Time</br>(sec)</th>
                                    <th>Billing Time</br>(sec)</th>
                                    <th>Billing Cycle</th>
                                    <th>Rate</br>(min,Currency)</th>
                                    <th>Total Price</th>
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
                                    <th>Month</th>
                                    <th>Account</th>
                                    <th>CountryCode</th>
                                    <th>Country</th>
                                    <th>Charge Type</th>
                                    <th>Charge Price</br>(Currency)</th>
                                    <th>Total Price</th>
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
                        <span style='margin-left: 10px;letter-spacing: 2px;'>Total Price: : </span>
                        <span style='margin-left: 10px;letter-spacing: 2px;'>${check.total}</span>
                    </div>
                    <div class="bottom">
                        <div class="left1" style="line-height: 30px;">
                            We sincerely appreciate your trust and
                            ongoing support. We kindly request that
                            you settle the invoice amount at your
                            earliest convenienceto maintain our
                            smooth and productive collaboration.
                        </div>
                        <div class="right1">
                            Please stamp/seal here
                        </div>
                    </div>
                </#if>


                <div class="page" style="height: 50.5px;position: absolute;bottom: 0;">
                    Page {i} of {lasePage}
                </div>

            </div>

        </div>
    </body>

</#list>

</html>