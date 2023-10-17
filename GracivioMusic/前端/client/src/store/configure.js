const configure = {
    state:{
        HOST: 'http://127.0.0.1:8888',  //后台访问地址根目录
        activeName: '',                  //当前选中的菜单名
        showAside: false,               //是否显示播放中的歌曲列表
        loginIn: false,                 //用户是否已登录
        isActive: false,                //当前歌曲是否已收藏
        showComment: false,
        showListComment: false
    },
    getters: {
        activeName: state => {
            let activeName = state.activeName
            if(!activeName){
                activeName = JSON.parse(window.sessionStorage.getItem('activeName')) 
            }
            return activeName
        },
        showAside: state => {
            let showAside = state.showAside
            if(!showAside){
                showAside = JSON.parse(window.sessionStorage.getItem('showAside')) 
            }
            return showAside
        },
        loginIn: state => {
            let loginIn = state.loginIn
            if(!loginIn){
                loginIn = JSON.parse(window.sessionStorage.getItem('loginIn')) 
            }
            return loginIn
        },
        isActive: state => {
            let isActive = state.isActive
            if(!isActive){
                isActive = JSON.parse(window.sessionStorage.getItem('isActive')) 
            }
            return isActive
        },
        showComment: state => {
            let showComment = state.showComment
            if(!showComment){
                showComment = JSON.parse(window.sessionStorage.getItem('showComment')) 
            }
            return showComment
        },  
        showListComment: state => {
            let showListComment = state.showListComment
            if(!showListComment){
                showListComment = JSON.parse(window.sessionStorage.getItem('showListComment')) 
            }
            return showListComment
        },        
    },
    mutations: {
        setActiveName: (state,activeName) => {
            state.activeName = activeName
            window.sessionStorage.setItem('activeName',JSON.stringify(activeName))
        },
        setShowAside: (state,showAside) => {
            state.showAside = showAside
            window.sessionStorage.setItem('showAside',JSON.stringify(showAside))
        },
        setLoginIn: (state,loginIn) => {
            state.loginIn = loginIn
            window.sessionStorage.setItem('loginIn',JSON.stringify(loginIn))
        },
        setIsActive: (state,isActive) => {
            state.isActive = isActive
            window.sessionStorage.setItem('isActive',JSON.stringify(isActive))
        },
        setShowComment: (state,showComment) => {
            state.showComment = showComment
            window.sessionStorage.setItem('showComment',JSON.stringify(showComment))
        },
        setShowListComment: (state,showListComment) => {
            state.showListComment = showListComment
            window.sessionStorage.setItem('showListComment',JSON.stringify(showListComment))
        },
    }
}

export default configure