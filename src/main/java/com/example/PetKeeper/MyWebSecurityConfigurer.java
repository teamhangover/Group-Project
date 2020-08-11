/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.example.PetKeeper;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import com.example.PetKeeper.service.MyUserService;

/**
 *
 * @author glamb
 */
@EnableWebSecurity
public class MyWebSecurityConfigurer extends WebSecurityConfigurerAdapter {

    @Autowired
    private MyUserService myUserService;

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

        http.authorizeRequests()//restrict access based on the HttpServletRequest
                .antMatchers("/").permitAll()
                .antMatchers("/index").permitAll()
                .antMatchers("/keeper/**").hasRole("Keeper") // to /** kleidwnei oles ts selides p ksekinane apo /admin
                .antMatchers("/owner/**").hasRole("Owner")
                .and()
                .formLogin() // We are customizing the form login process
                .loginPage("/login") // This is the url to show the login page
                .permitAll() //Allow everyone to see login page. Don't have to be logged in.
                .and()
                .logout()
                .and()
                .exceptionHandling() // ti na kanw an exw exception?
                .accessDeniedPage("/access-denied"); //phgaine edw
    }  

    @Bean
    public DaoAuthenticationProvider authenticationProvider() {

        DaoAuthenticationProvider auth = new DaoAuthenticationProvider();

        auth.setUserDetailsService(myUserService);
        auth.setPasswordEncoder(passwordEncoder());
        return auth;
    }

    @Bean
    public PasswordEncoder passwordEncoder() {

        PasswordEncoder encoder = new BCryptPasswordEncoder();

        return encoder;
    }
}
