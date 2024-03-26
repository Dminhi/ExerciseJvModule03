<?xml version="1.0" encoding="UTF-8"?>
<beans xmlns="http://www.springframework.org/schema/beans"
       xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
       xmlns:context="http://www.springframework.org/schema/context"
       xmlns:p="http://www.springframework.org/schema/p"
       xmlns:mvc="http://www.springframework.org/schema/mvc"
       xsi:schemaLocation="
        http://www.springframework.org/schema/beans
        http://www.springframework.org/schema/beans/spring-beans.xsd
        http://www.springframework.org/schema/context
        http://www.springframework.org/schema/context/spring-context.xsd
      http://www.springframework.org/schema/mvc
      http://www.springframework.org/schema/mvc/spring-mvc.xsd">

    <!-- Spring MVC Annotation -->
    <context:annotation-config />
    <mvc:annotation-driven/>

    <!--Controller -->
    <context:component-scan base-package="com.example.controller"/>
    <!--View -->
    <bean id="viewResolver"
          p:prefix="/WEB-INF/views/" p:suffix=".jsp"
          class="org.springframework.web.servlet.view.InternalResourceViewResolver"/>
</beans>
