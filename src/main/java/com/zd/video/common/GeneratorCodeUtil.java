package com.zd.video.common;


import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

public class GeneratorCodeUtil {  
  
    public static void main(String[] args) throws Exception{  
  
        List<String> warnings = new ArrayList<String>();  
        boolean overwrite = true;  
        ClassLoader classLoader = GeneratorCodeUtil.class.getClassLoader();  
        URL resource = classLoader.getResource("generatorConfig.xml");  
        String path = resource.getPath();  
        File configFile = new File(path);  
        ConfigurationParser cp = new ConfigurationParser(warnings);  
        Configuration config = cp.parseConfiguration(configFile);  
        DefaultShellCallback callback = new DefaultShellCallback(overwrite);  
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);  
        myBatisGenerator.generate(null);  
    }  
}