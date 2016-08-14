package com.listener;

import com.zhaogang.tools.cache.ConfigManager;
import org.springframework.beans.factory.InitializingBean;

/**
 * Created by cheng.hu on 2016/8/3.
 */
public class WebContextInitializing implements InitializingBean {

    public static String CONFIG_APPLICATION_FILE_PATH = "application.properties";

    @Override
    public void afterPropertiesSet() throws Exception {
        //加载系统配置文件到缓存中
        ConfigManager.getInstance().reloadProperties(CONFIG_APPLICATION_FILE_PATH);
    }
}
