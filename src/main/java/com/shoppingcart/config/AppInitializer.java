package com.shoppingcart.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class AppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	
	 @Override
	protected Class<?>[] getRootConfigClasses() { //-->là cấu hình chung
		return new Class[] { WebMvcConfig.class };
	}

	@Override
	protected Class<?>[] getServletConfigClasses() { //-->là cấu hình riêng
		return new Class[] { AppContext.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
}
