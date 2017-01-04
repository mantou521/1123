<?php
namespace Admin\Controller;
use Think\Controller;
class GoodsController extends Controller {
    public function product_list()
    {
        $G=M('goods');
        $goods=$G->where('goods_id>0')->select();
        $this->assign('goods',$goods);
        $this->display();
    }
/*添加商品*/
    public function product_add()
    {

        $_SESSION['webupload']=NULL;
        $this->display();
    }

    public function product_add_post()
    {
            $content=htmlspecialchars_decode(I('editorValue'));

            $num=count(array_filter(explode(',',I('goods_sn'))));
            $data['src']=json_encode($_SESSION['webupload']);
            $data['goods_name']=I('goods_name');
            $data['goods_description']=I('goods_description');
            $data['goods_keywords']=I('keywords');
            $data['goods_price']=I('price');
            $data['goods_content']="$content";
            $data['goods_num']=$num;
            $data['is_on_sale']='';
            $data['sort']=I('sort');
            $data['goods_sn'] = implode(',',array_filter(explode(',',I('goods_sn'))));
            $data['thumb']=upload_uuce($_FILES["pic"]["tmp_name"],1);
            $Goods=M('goods');
            $Goods->add($data);
            $sn = $Goods->where( array('goods_name' => I('goods_name')))->find();
            foreach (explode(',',$sn['goods_sn']) as $value) {
                M('out_uu')->add(array('goods_id' => $sn['goods_id'],'uuce' => $value));
            }
            $this->success('添加成功',U('Admin/Goods/product_list'));
    }
/*
 * 修改商品
*/
    public function product_edit(){
        $good=M('goods')->where('goods_id='.I('goods_id'))->find();
        $good['goods_content'] = $good['goods_content'];
        $this->assign('good',$good);

        $this->display();
    }
    public function product_edit_post()
    {
       $content=htmlspecialchars_decode(I('post_content'));

        $num=count(array_filter(explode(',',I('goods_sn'))));
//       $data['src']=json_encode($_SESSION['webupload']);
        $data['goods_name']=I('goods_name');
        $data['goods_description']=I('goods_description');
        $data['goods_keywords']=I('keywords');
        $data['goods_price']=I('price');
        $data['goods_content']="$content";
        $data['goods_num']=$num;
        $data['is_on_sale']='';
        $data['sort']=I('sort');
        $data['goods_sn'] = implode(',',array_filter(explode(',',I('goods_sn'))));
        $_FILES["pic"]["tmp_name"] && $data['thumb']=upload_uuce($_FILES["pic"]["tmp_name"],1);
        $Goods=M('goods');
        $Goods->where('goods_id='.I('goods_id'))->save($data);
        $this->success('修改成功',U('Admin/Goods/product_list'));
    }
/*
 * 删除商品
 * */
    public function product_delete(){
        echo $_POST['id'];
        M('goods')->where('goods_id='.I('id'))->delete();

    }
    public function webup(){
        $config = array(
            'mimes'         =>  array(), //允许上传的文件MiMe类型
            'maxSize'       =>  0, //上传的文件大小限制 (0-不做限制)
            'exts'          =>  array('jpg', 'gif', 'png', 'jpeg'), //允许上传的文件后缀
            'autoSub'       =>  true, //自动子目录保存文件
            'subName'       =>  array('date', 'Y-m-d'), //子目录创建方式，[0]-函数名，[1]-参数，多个参数使用数组
            'rootPath'      =>  './Public/Uploads/', //保存根路径
            'savePath'      =>  '',//保存路径

        );
        $upload = new \Think\Upload($config);// 实例化上传类

        $info   =   $upload->upload();

        $_SESSION['webupload'][]=$info['file']['savepath'].$info['file']['savename'];

        if(!$info) {

            $this->error($upload->getError());// 上传错误提示错误信息

        }else{// 上传成功
            /*
             * 分离缩略图和轮播图
             */
            //dump($info);
            foreach ($info as $va){

                if ($va['key']=="suoluetu"){
                    $suoluetu.="Public/Uploads/luxian/".$va['savepath'].$va['savename']."||";
                }else {
                    $lunbotu.="Public/Uploads/luxian/".$va['savepath'].$va['savename']."||";
                }
            }
        }
    }


}