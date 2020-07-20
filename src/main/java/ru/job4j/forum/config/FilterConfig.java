package ru.job4j.forum.config;

import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import ru.job4j.forum.filter.AuthFilter;

@Configuration
public class FilterConfig {

    @Bean
    public FilterRegistrationBean filterRegistrationBean() {
        FilterRegistrationBean filterRegistrationBean = new FilterRegistrationBean();
        filterRegistrationBean.setFilter(new AuthFilter());
        filterRegistrationBean.setOrder(1);
        filterRegistrationBean.addUrlPatterns("/post/edit");
        filterRegistrationBean.addUrlPatterns("/message/create");
        return filterRegistrationBean;
    }
}