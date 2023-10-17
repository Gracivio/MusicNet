export const mixin = {
    methods:{
        notify(title,type){
            this.$notify({
                title: title,
                type: type
            })
        },
        getUrl(url){
            return `${this.$store.state.HOST}${url}`
        },
        changeSex(sex) {
            if (sex === 0) {
              return '女';
            } else if (sex === 1) {
              return '男';
            } else if (sex === 2) {
              return '组合';
            }
            return '';
        },
         //获取生日
         attachBirth(val){
            return String(val).substr(0,10);
        },
         //上传图片之前的校验
         beforeAvatorUpload(file){
          const isJPG = (file.type === 'image/jpeg')||(file.type === 'image/png');
          if(!isJPG){
              this.$message.error('上传头像图片只能是jpg或png格式');
              return false;
          }
          const isLt2M = (file.size / 1024 /1024) < 2;
          if(!isLt2M){
              this.$message.error('上传头像图片大小不能超过2MB');
              return false;
          }
          return true;
      },
      //上传图片成功之后要做的工作
      handleAvatorSuccess(res){
          let _this = this;
          if(res.code == 1){
              _this.getData();
              _this.$notify({
                  title: '上传成功',
                  type: 'success'
              });
          }else{
              _this.$notify({
                  title: '上传失败',
                  type: 'error'
              });
          }
      },
      // 删除功能
      handleDelete(id){
        this.id_choose = id;
        this.deleteVisible = true;
      },
     //将已选的项赋值给变量
     handleSelectionChange(val){
        this.multipleSelection = val;
     },
     //批量删除
     delAll(){
        for(let item of this.multipleSelection){
            this.handleDelete(item.id);
            this.deleteRow();
        }
        this.multipleSelection= [];
     }
    }
}