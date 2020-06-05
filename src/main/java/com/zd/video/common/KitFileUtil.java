package com.zd.video.common;

import it.sauronsoftware.jave.EncoderException;
import it.sauronsoftware.jave.InputFormatException;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.bytedeco.javacpp.opencv_core;
import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.OpenCVFrameConverter;
import org.springframework.util.ClassUtils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import org.bytedeco.javacpp.opencv_core.IplImage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import it.sauronsoftware.jave.Encoder;
import it.sauronsoftware.jave.MultimediaInfo;


import java.awt.image.BufferedImage;
import javax.imageio.ImageIO;
import org.bytedeco.javacv.FrameGrabber.Exception;
import org.bytedeco.javacv.Java2DFrameConverter;

public class KitFileUtil {

    public Map<String, Object> kitFileUtil(@RequestParam("imgFile") MultipartFile[] imgFile, HttpServletRequest request, HttpServletResponse response){

        // 文件保存目录路径
        //String savePath = request.getSession().getServletContext().getRealPath("")  + "upload\\video";
        String savePath = ClassUtils.getDefaultClassLoader().getResource("").getPath() + "static/upload/video";
        System.out.println("正确路径：" + savePath);
        //StringBuffer cover = new StringBuffer("");
        //本地文件保存目录URL
        //String saveUrl = request.getContextPath() + "/" + "";
        //服务器上的路径
        String saveUrl = "/" + "";

        //定义允许上传的文件扩展名
        HashMap<String, String> extMap = new HashMap<String, String>();
        extMap.put("image", "gif,jpg,jpeg,png,bmp");
        extMap.put("flash", "swf,flv");
        extMap.put("media", "swf,flv,mp3,wav,wma,wmv,mid,avi,mpg,asf,rm,rmvb,mp4");
        extMap.put("file", "doc,docx,xls,xlsx,ppt,txt,zip,rar,gz,bz2");

        //最大文件大小
        long maxSize = 20480000;

        response.setContentType("text/html; charset=UTF-8");

        if (!ServletFileUpload.isMultipartContent(request)) {
            return getError("请选择文件。");
        }
        //检查目录
        File uploadDir = new File(savePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
//            return getError("上传目录不存在。");
        }

        //检查目录写权限
        if (!uploadDir.canWrite()) {
            return getError("上传目录没有写权限。");
        }

        String dirName = request.getParameter("dir");
        if (dirName == null) {
            dirName = "image";
        }
        if (!extMap.containsKey(dirName)) {
            return getError("目录名不正确。");
        }

        //创建文件夹
        //savePath += dirName + "/";
        //saveUrl += dirName + "/";
        File saveDirFile = new File(savePath);
        if (!saveDirFile.exists()) {
            saveDirFile.mkdirs();
        }
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String ymd = sdf.format(new Date());
        savePath += "/" + ymd + "/";
        saveUrl += ymd + "/";
        File dirFile = new File(savePath);
        if (!dirFile.exists()) {
            dirFile.mkdirs();
        }
        String url[] = new String[imgFile.length];
        Map<String, Object> map = new HashMap<String, Object>();
        for (int i = 0; i < imgFile.length; i++) {
            System.out.println(imgFile[i]);
            // 获取上传文件的名字
            String fileName = imgFile[i].getOriginalFilename();
            // 获取长度
            long fileSize = imgFile[i].getSize();
            if (!imgFile[i].isEmpty()) {
                // 检查文件大小
                //long size = imgFile[i].getSize();
                if (imgFile[i].getSize() > maxSize) {
                    return getError("上传文件大小超过限制。");
                }
                // 检查扩展名
                String fileExt = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
                if (!Arrays.<String>asList(extMap.get(dirName).split(",")).contains(fileExt)) {
                    return getError("上传文件扩展名是不允许的扩展名。\n只允许" + extMap.get(dirName) + "格式。");
                }
                SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
                String newFileName = df.format(new Date()) + "_" + new Random().nextInt(1000) + "." + fileExt;
                //String newCoverName = df.format(new Date()) + "_" + new Random().nextInt(1000) + ".jpg" ;
                try {
                    // 保存文件
                    System.out.println(saveUrl + newFileName);
                    FileCopyUtils.copy(imgFile[i].getInputStream(), new FileOutputStream(savePath + newFileName));
                    //cover.append(savePath);
                    savePath += newFileName;
                } catch (IOException e) {
                    return getError("上传文件失败。");
                }
                url[i] = "/upload/video" + saveUrl + newFileName;
                System.out.println("----------------kit传输路径是："+url[i]+"----------------------------");
                System.out.println("----------------saveUrl是："+saveUrl+"----------------------------");
                System.out.println("----------------newFileName："+newFileName+"----------------------------");
//                    String time = null;
//                    try {
//                        File file = new File("/");
//                        FileUtils.copyInputStreamToFile(imgFile[i].getInputStream(), file);
//                        time = ReadVideoTime(file);
//                        file.delete();
//                    } catch (InterruptedException e) {
//                        e.printStackTrace();
//                    }catch (IOException io){
//                        io.printStackTrace();
//                    }
//                    map.put("time",time);
                map.put("fileSize",fileSize);

            }
        }

        map.put("error", 0);
        map.put("url", url);
        map.put("savePath", savePath);
        return map;
    }

    private Map<String, Object> getError(String message) {
        Map<String, Object> map = new HashMap<String, Object>();
//
        map.put("error", 101);
        map.put("message", message);
        return map;
    }

    /**
     * 获取指定视频的帧并保存为图片至指定目录
     * @param videofile  源视频文件路径
     * @param framefile  截取帧的图片存放路径
     * @throws Exception
     * @throws IOException
     */
    public static void fetchFrame(String videofile, String framefile)
            throws Exception, IOException {
        //服务器上添加
        videofile = "/"+videofile;
        framefile = "/"+framefile;

        FFmpegFrameGrabber ff = new FFmpegFrameGrabber(videofile);
        ff.start();
        ff.getAudioChannels();
        String rotate =ff.getVideoMetadata("rotate");//视频的旋转角度
        int lenght = ff.getLengthInFrames();
        int i = 0;
        Frame f = null;
        while (i < lenght) {
            // 过滤前5帧，避免出现全黑的图片，依自己情况而定
            f = ff.grabFrame();
            if ((i > 5) && (f.image != null)) {
                System.out.println("获取到图片！！！！！"+i);
                break;
            }
            IplImage src = null;
            if(null !=rotate &&rotate.length() > 1) {
                OpenCVFrameConverter.ToIplImage converter =new OpenCVFrameConverter.ToIplImage();
                src =converter.convert(f);
                f =converter.convert(rotate(src, Integer.valueOf(rotate)));
            }
            i++;
        }
        doExecuteFrame(f, framefile);
    }

    /**
     * 抓取视频帧
     * @param src
     * @param angle
     * @return
     */
    public static IplImage rotate(IplImage src,int angle) {
        IplImage img = IplImage.create(src.height(),src.width(),src.depth(),src.nChannels());
        opencv_core.cvTranspose(src,img);
        opencv_core.cvFlip(img,img,angle);
        return img;
    }

    /**
     * 存储视频帧
     * @param f
     * @param targetFileName
     */
    public static void doExecuteFrame(Frame f,String targetFileName) {
        if (null ==f ||null ==f.image) {
            return;
        }
        Java2DFrameConverter converter =new Java2DFrameConverter();
        BufferedImage bi =converter.getBufferedImage(f);
        File output =new File(targetFileName);
        try {
            ImageIO.write(bi,"jpg",output);
        }catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 获取视频时长
     * @param source
     * @return
     * @throws InterruptedException
     */
    public String ReadVideoTime(File source) throws InterruptedException {
        Encoder encoder = new Encoder();
        String length = "";
        try {
            MultimediaInfo m = encoder.getInfo(source);
            long ls = m.getDuration() / 1000;
            int hour = (int) (ls / 3600);
            int minute = (int) (ls % 3600) / 60;
            int second = (int) (ls - hour * 3600 - minute * 60);
            length = hour + ":" + minute + ":" + second;
        } catch (InputFormatException e) {
            e.printStackTrace();
        } catch (EncoderException e) {
            e.printStackTrace();
        }
        return length;
    }
/**
 * javacv 方案一
 */
//    public static Map<String, Object> getScreenshot(String filePath) throws Exception {
//
//        System.out.println("截取视频截图开始：" + System.currentTimeMillis());
//        Map<String, Object> result = new HashMap<String, Object>();
//        FFmpegFrameGrabber grabber = FFmpegFrameGrabber.createDefault(filePath);
//
//        // 第一帧图片存储位置
//        String targerFilePath = filePath.substring(0, filePath.lastIndexOf("\\"));
//        // 视频文件名
//        String fileName = filePath.substring(filePath.lastIndexOf("\\") + 1);
//        // 图片名称
//        String targetFileName = fileName.substring(0, fileName.lastIndexOf("."));
//        System.out.println("视频路径是：" + targerFilePath);
//        System.out.println("视频文件名：" + fileName);
//        System.out.println("图片名称是：" + targetFileName);
//
//        grabber.start();
//        //设置视频截取帧（默认取第一帧）
//        Frame frame = grabber.grabImage();
//        //视频旋转度
//        String rotate = grabber.getVideoMetadata("rotate");
//        Java2DFrameConverter converter = new Java2DFrameConverter();
//        //绘制图片
//        BufferedImage bi = converter.getBufferedImage(frame);
//        if (rotate != null) {
//            // 旋转图片
//            bi = rotate(bi, Integer.parseInt(rotate));
//        }
//        //图片的类型
//        String imageMat = "jpg";
//        //图片的完整路径
//        String imagePath = targerFilePath + File.separator + targetFileName + "." + imageMat;
//        //创建文件
//        File output = new File(imagePath);
//        ImageIO.write(bi, imageMat, output);
//
//        //拼接Map信息
//        result.put("videoWide", bi.getWidth());
//        result.put("videoHigh", bi.getHeight());
//        long duration = grabber.getLengthInTime() / (1000 * 1000);
//        // result.put("rotate", StringUtils.isBlank(rotate)? "0" : rotate);
//        result.put("format", grabber.getFormat());
//        result.put("imgPath", output.getPath());
//        System.out.println("视频的宽:" + bi.getWidth());
//        System.out.println("视频的高:" + bi.getHeight());
//        System.out.println("视频的旋转度：" + rotate);
//        System.out.println("视频的格式：" + grabber.getFormat());
//        System.out.println("此视频时长（s/秒）：" + duration);
//        grabber.stop();
//        System.out.println("截取视频截图结束：" + System.currentTimeMillis());
//        return result;
//    }
//
//
//    /**
//     * @param src
//     * @param angel 视频旋转度
//     * @return BufferedImage
//     * @Description: 根据视频旋转度来调整图片
//     */
//    public static BufferedImage rotate(BufferedImage src, int angel) {
//        int src_width = src.getWidth(null);
//        int src_height = src.getHeight(null);
//        int type = src.getColorModel().getTransparency();
//        Rectangle rect_des = calcRotatedSize(new Rectangle(new Dimension(src_width, src_height)), angel);
//        BufferedImage bi = new BufferedImage(rect_des.width, rect_des.height, type);
//        Graphics2D g2 = bi.createGraphics();
//        g2.translate((rect_des.width - src_width) / 2, (rect_des.height - src_height) / 2);
//        g2.rotate(Math.toRadians(angel), src_width / 2, src_height / 2);
//        g2.drawImage(src, 0, 0, null);
//        g2.dispose();
//        return bi;
//    }
//
//
//    /**
//     * @param src
//     * @param angel
//     * @return Rectangle
//     * @Description: 计算图片旋转大小
//     */
//    public static Rectangle calcRotatedSize(Rectangle src, int angel) {
//        if (angel >= 90) {
//            if (angel / 90 % 2 == 1) {
//                int temp = src.height;
//                src.height = src.width;
//                src.width = temp;
//            }
//            angel = angel % 90;
//        }
//        double r = Math.sqrt(src.height * src.height + src.width * src.width) / 2;
//        double len = 2 * Math.sin(Math.toRadians(angel) / 2) * r;
//        double angel_alpha = (Math.PI - Math.toRadians(angel)) / 2;
//        double angel_dalta_width = Math.atan((double) src.height / src.width);
//        double angel_dalta_height = Math.atan((double) src.width / src.height);
//        int len_dalta_width = (int) (len * Math.cos(Math.PI - angel_alpha - angel_dalta_width));
//        int len_dalta_height = (int) (len * Math.cos(Math.PI - angel_alpha - angel_dalta_height));
//        int des_width = src.width + len_dalta_width * 2;
//        int des_height = src.height + len_dalta_height * 2;
//        return new java.awt.Rectangle(new Dimension(des_width, des_height));
//
//    }


}
