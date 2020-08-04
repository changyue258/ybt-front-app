package com.sinosoft.config;

import com.baomidou.mybatisplus.core.incrementer.IKeyGenerator;
import com.baomidou.mybatisplus.extension.incrementer.H2KeyGenerator;
import com.baomidou.mybatisplus.extension.incrementer.OracleKeyGenerator;
import com.baomidou.mybatisplus.extension.plugins.PaginationInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
//import com.baomidou.mybatisplus.extension.plugins.PerformanceInterceptor;
/**
 * 
 * @author dongwn mybatis-plus配置类
 *
 */
@Configuration
@MapperScan({"com.sinosoft.mapper"})
public class MyBatisPlusConfig {

	// mybatis-plus分页插件
	@Bean
	public PaginationInterceptor paginationInterceptor() {
		return new PaginationInterceptor();
	}
}
