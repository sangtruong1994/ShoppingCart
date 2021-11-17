package com.shoppingcart.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
public class WebSevurityConfig extends WebSecurityConfigurerAdapter{
	
	@Bean
	public BCryptPasswordEncoder bCryptPasswordEncoder() {
		return new BCryptPasswordEncoder();
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception{
		
		http.csrf().disable();
		http.authorizeRequests().antMatchers("/orderlist","/order","/accountInfo")
		.access("hasAnyRole('EMPLOYEE','MANAGER')");//
		
		http.authorizeRequests().antMatchers("/product").access("hasRole('MANAGER')");
		
		http.authorizeRequests().and().exceptionHandling().accessDeniedPage("/403");
		
		http.authorizeRequests().and().formLogin()
			.loginProcessingUrl("/j_spring_security_check")
			.loginPage("/login")
			.defaultSuccessUrl("/accountInfo")
			.failureUrl("/login?error=true")
			.usernameParameter("username")
			.passwordParameter("password")
			.and()
			.logout()
			.logoutUrl("/logout")
			.logoutSuccessUrl("/");
	}
		
	@Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception{
		auth.inMemoryAuthentication().withUser("employee").password("employee").authorities("ROLE_EMPLOYEE");
		auth.inMemoryAuthentication().withUser("manager").password("manager").authorities("ROLE_MANAGER");
	}
	
}
