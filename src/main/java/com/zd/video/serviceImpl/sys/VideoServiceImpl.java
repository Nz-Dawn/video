package com.zd.video.serviceImpl.sys;

import com.zd.video.common.KitFileUtil;
import com.zd.video.common.UserUtils;
import com.zd.video.dao.sys.FavoriteMapper;
import com.zd.video.dao.sys.VideoMapper;
import com.zd.video.po.sys.Favorite;
import com.zd.video.po.sys.User;
import com.zd.video.po.sys.Video;
import com.zd.video.service.sys.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ClassUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;
    @Autowired
    private FavoriteMapper favoriteMapper;
    @Override
    public int deleteByPrimaryKey(Integer id) {
        try {
            return videoMapper.deleteByPrimaryKey(id);
        }catch (Exception e){
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    @Transactional
    public int insert(Video record) {
        try{
            return videoMapper.insert(record);
        }catch (Exception e ){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int insertSelective(Video record) {
        String basePath = ClassUtils.getDefaultClassLoader().getResource("").getPath() + "static";
        String base = basePath.substring(1);
        String videoUrl = base + record.getUrl();
        StringBuffer cover  = new StringBuffer() ;
        try{
            String uri = record.getUrl();
            if(uri !=null) {
                String[] temp = uri.split(".m");
                cover.append(temp[0]);
                cover.append(".jpg");
               // cover = temp[0]+".jpg";
                record.setCover(cover.toString());
            }
            String imgUrl = base + cover ;
            System.out.println("----------------------进入获取视频截图service"+imgUrl+"----------------------------");
            try {
                KitFileUtil.fetchFrame(videoUrl, imgUrl);
            }catch (IOException e){
                e.printStackTrace();
            }
            return videoMapper.insertSelective(record);
        }catch (Exception e ){
            e.printStackTrace();
        }
        return -1;
    }

    @Override
    public Video selectByPrimaryKey(Integer id) {
        return videoMapper.selectByPrimaryKey(id);
    }

    @Override
    @Transactional
    public int updateByPrimaryKeySelective(Video record) {
        try{
            return videoMapper.updateByPrimaryKeySelective(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public int updateByPrimaryKey(Video record) {
        try{
            return videoMapper.updateByPrimaryKey(record);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    @Transactional
    public List<Video> selectByUserId(Integer id) {
        try{
            if(id != null){
                return videoMapper.selectByUserId(id);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Video> selectByCategory(Integer id) {
        try{
            if(id != null){
                return videoMapper.selectByCategory(id);
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Video> selectAllVideo() {
        try{
            return videoMapper.selectAllVideo();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Video> selectByDesc(String desception) {
        try{
            return videoMapper.selectByDesc(desception);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Video> selectByIds(List<Integer> ids) {
        try{
            return videoMapper.selectByIds(ids);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Video> getSuggestions() {
        try {
            User user = UserUtils.getLoginUser();
            List<Favorite> favorites = favoriteMapper.selectByUserId(user.getId());
            if(favorites == null || favorites.size() <= 0){
                return null;
            }
            List<Integer> ids = new ArrayList<>();
            for (Favorite f:favorites) {
                ids.add(f.getVideoid());
            }
            List<Video> Fvideos = videoMapper.selectByIds(ids);
            if(Fvideos == null || Fvideos.size()<= 0){
                return null;
            }
            List<Integer> category = new ArrayList<>();
            for (Video v : Fvideos) {
                category.add(v.getCategory());
            }
            if(category == null || category.size()<= 0){
                return null;
            }
            return videoMapper.selectByCategorys(category);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Video> selectByCategorys(List<Integer> categorys) {
        try{
            return videoMapper.selectByCategorys(categorys);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    @Transactional
    public List<Video> selectMyVideoByDesc(Video video) {
        try{
            return videoMapper.selectMyVideoByDesc(video);
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 获取视频大小,判断在那个范围
     * @return
     */
    @Override
    public Long  getFileMaxSize(){
        try {
            User user = UserUtils.getLoginUser();
            Long number = 0L;
            Long maxSize = 0L;
            List<Favorite> favorites = favoriteMapper.selectByUserId(user.getId());
            for (Favorite f : favorites) {
                number++;
            }
            if(number <= 5){
                maxSize = 5100000L;
            }else if(number > 5 && number <100){
                maxSize = 10240000L;
            }else{
                maxSize = 20000000L;
            }
            return maxSize;
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
