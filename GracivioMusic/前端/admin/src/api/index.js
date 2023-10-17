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
//============歌单相关================
//查询歌单
export const getAllSongList =() => get(`SongList/allSongList`);
//添加歌单
export const setSongList = (params) => post(`SongList/add`,params);
//编辑歌单
export const updateSongList = (params) => post(`SongList/update`,params);
//删除歌单
export const deleteSongList = (id) => get(`SongList/delete?id=${id}`);

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

//===============收藏===================
//指定用户的收藏列表
export const getCollectOfUserId = (userId) => get(`/collect/collectOfUserId?userId=${userId}`);
//删除用户收藏的歌曲
export const deleteCollection = (userId,songId) => get(`collect/delete?userId=${userId}&songId=${songId}`);

//===============评论===================
//指定歌单的评论列表
export const getCommentOfSongListId = (songListId) => get(`/comment/commentOfSongListId?songListId=${songListId}`);
//删除评论
export const deleteComment = (id) => get(`comment/delete?id=${id}`);