//HTTP访问工具类
import axios from "axios";
import { error } from "shelljs";
axios.defaults.timeout = 5000; //超时时间上限是5s
axios.defaults.withCredentials = true; //允许跨域，即访问后端
//Content-Type响应头
axios.defaults.headers.post['Content-Type']='application/x-www-form-urlencoded;charset"UTF-8';
//基础URL
axios.defaults.baseURL = "http://localhost:8888";
//响应拦截
axios.interceptors.response.use(
    response => {
        //如果reponse为200，则接口成功访问
        if(response.status==200){
            return Promise.resolve(response);
        }
        else{
            return Promise.reject(response);
        }
    },
    error => {
        if(error.response.status){
            switch(error.response.status){
                case 401: // 登录失败
                    router.replace({
                        path:'/',
                        query:{
                            redirect: router.currentRoute.fullPath
                        }
                    });
                    break;
                case 404: // 访问失败
                    break;
            }
            return Promise.reject(error.response);
        }
    }
);
//访问的GET方法
export function get(url,params={}){
    return new Promise((resolve,reject) => {
        axios.get(url,{params:params}).then(response => {resolve(response.data);}).catch(err => {reject(err);})
    });
}
//访问的POST方法
export function post(url,data={}){
    return new Promise((resolve,reject) => {
        axios.post(url,data).then(response => {resolve(response.data);}).catch(err => {reject(err);})
    });
}
