package com.sinosoft.config;

import com.sinosoft.ybframework.core.util.SpringUtil;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.ImportResource;

/**
 *
 * @author AgencyConfigFactoryBean加载
 *
 */
@Configuration
@ImportResource(locations = {"classpath*:ybt-config/applicationContext/*.xml"})
public class SpringApplicationAutoConfig {

    @Bean
    @ConditionalOnMissingBean(value = SpringUtil.class)
    public SpringUtil createSpringUtil() {

        return new SpringUtil();
    }
}
