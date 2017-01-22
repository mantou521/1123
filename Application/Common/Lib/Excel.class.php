<?php

/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/9/12
 * Time: 17:14
 */
namespace Common\Lib;
class Excel
{
    public function export_member($array)
    {
        $strTable ='<table width="500" border="1">';
        $strTable .= '<tr>';
        $strTable .= '<td style="text-align:center;font-size:12px;width:120px;">工号</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="100">姓名</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">性别</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">手机</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">邮编</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">合同编号</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">编号</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">部门代码</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">推荐人工号</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">推荐人姓名</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">身份证</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">银行</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">银行卡号</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">地址</td>';
        $strTable .= '<td style="text-align:center;font-size:12px;" width="*">加入时间</td>';
        $strTable .= '</tr>';
        if(is_array($array)){
            foreach($array as $k=>$val){
                $strTable .= '<tr>';
                $strTable .= '<td style="text-align:center;font-size:12px;">&nbsp;'.$val['nickname'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['username'].' </td>';
                $val['sex'] = $val['sex'] == 0 ?'女':'男';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['sex'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['usertel'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['postcode'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">&nbsp;'.$val['contract_no'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">&nbsp;'.$val['nickname'].$val['postcode'].$val['e_ulevel'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['departnum'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">&nbsp;'.$val['regonghao'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['rename'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">&nbsp;'.$val['usercard'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['bankname'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">&nbsp;'.$val['bankcard'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['useraddress'].'</td>';
                $strTable .= '<td style="text-align:left;font-size:12px;">'.$val['pdt'].'</td>';
                $strTable .= '</tr>';
            }
        }
        $strTable .='</table>';
        unset($orderList);
        downloadExcel($strTable,'order');
        exit();
    }

}