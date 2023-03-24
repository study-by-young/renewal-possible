package com.possible.config;

import org.springframework.boot.autoconfigure.condition.ConditionalOnExpression;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableSwagger2
@ConditionalOnExpression(value = "${swagger.enable:false}")
public class SwaggerConfig {

    @Bean
    public Docket docket() {
        String groupName = "possible";
        return new Docket(DocumentationType.SWAGGER_2)
                .apiInfo(apiInfo())
                .select()
                .apis(RequestHandlerSelectors.basePackage("com.possible"))
                .paths(PathSelectors.any())
                .build()
                .groupName(groupName)
                ;
    }

    private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
                .title("possible API doc")
                .version("1.0.0")
                .build();
    }

}
