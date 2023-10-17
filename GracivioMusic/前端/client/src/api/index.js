// 业务相关，引入HTTP类中的方法，提高封装性和复用性
import {get,post} from "./http";
// 判断admin是否能够登录成功
export const getLoginStatus = (params) => post(`admin/login/status`,params); //与后端联动
//添加歌手
export const setSinger = (params) => post(`singer/add`,params);
//查询所有歌手
export const getAllSinger = () => get(`singer/allSinger`);
//修改歌手信息
export const update = (params) => post(`singer/update`,params);
//删除歌手信息
export const deleteSinger = (id) => get(`singer/delete?id=${id}`);

//============歌曲相关================
//根据歌手id查询歌曲
export const songOfSingerId =(id) => get(`song/singer/detail?singerId=${id}`);
//编辑歌曲
export const updateSong = (params) => post(`song/update`,params);
//删除歌曲
export const delSong = (id) => get(`song/delete?id=${id}`);
//根据歌曲id查询歌曲对象
export const songOfSongId =(id) => get(`song/detail?songId=${id}`);
//根据歌曲名获取歌曲对象
export const songOfSongName =(songName) => get(`song/songOfSongName?songName=${songName}`);
//查询所有歌曲
export const allSong =() => get(`song/allSong`);
//模糊查询
export const likeSongOfName =(keywords) => get(`song/likeSongOfName?songName=${keywords}`);
//点击更新
export const countTimes =(songId) => get(`song/countTimes?songId=${songId}`);
//============歌单相关================
//查询歌单
export const getAllSongList =() => get(`SongList/allSongList`);
//添加歌单
export const setSongList = (params) => post(`SongList/add`,params);
//编辑歌单
export const updateSongList = (params) => post(`SongList/update`,params);
//删除歌单
export const deleteSongList = (id) => get(`SongList/delete?id=${id}`);
//模糊查询
export const getSongListOfLikeTitle = (keywords) => get(`SongList/songListLikeTitle?title=${keywords}`);
//根据风格查询
export const getSongListOfLikeStyle = (style) => get(`SongList/songListOfStyle?style=${style}`);
//============歌单的歌曲相关============
//根据歌单id查询歌曲列表
export const listSongDetail = (songListId) => get(`listSong/detail?songListId=${songListId}`);
//给歌单增加歌曲
export const listSongAdd = (params) => post(`listSong/add`,params);
//删除歌单的歌曲
export const delListSong = (songId,songListId) => get(`listSong/delete?songId=${songId}&songListId=${songListId}`);
//============用户相关================
//查询用户
export const getAllConsumer =() => get(`client/allClient`);
//添加用户
export const setConsumer = (params) => post(`client/add`,params);
//编辑用户
export const updateConsumer = (params) => post(`client/update`,params);
//删除用户
export const delConsumer = (id) => get(`client/delete?id=${id}`);
//根据用户id查询该用户的详细信息
export const getUserOfId =(id) => get(`client/selectByPrimaryKey?id=${id}`);
//注册
export const SignUp =(params) => post(`/client/add`,params);
//登录
export const loginIn =(params) => post(`/client/login`,params);
//更新用户信息
export const updateUserMsg =(params) => post(`/client/update`,params);

//===============收藏===================
//指定用户的收藏列表
export const getCollectOfUserId = (userId) => get(`/Collect/CollectOfUserId?userId=${userId}`);
//删除用户收藏的歌曲
export const deleteCollection = (userId,songId) => post(`Collect/delete?userId=${userId}&songId=${songId}`);
//新增收藏
export const setCollect =(params) => post(`/Collect/add`,params);

//===============评论===================
//添加评论
export const addComment = (params) => post(`/SongComment/add`,params);
//获取评论
export const getComment = (id) => get(`/SongComment/allComment?songId=${id}`);
//添加评论
export const addListComment = (params) => post(`/SongListComment/add`,params);
//获取评论
export const getListComment = (id) => get(`/SongListComment/allComment?songListId=${id}`);
