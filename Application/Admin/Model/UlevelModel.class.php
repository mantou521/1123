<?php
/**
 * Created by PhpStorm.
 * User: aikes
 * Date: 2016/10/20
 * Time: 14:55
 */
namespace Admin\Model;
use Think\Model;
class UlevelModel extends Model{

//    protected $tableName = 'travel_user';
    public function getByUlevel($ulevel)
    {
      return  $this->where('ulevel ='.$ulevel)->find();
    }


}