package com.sekolah.apigateway.Config;

import org.springframework.cloud.gateway.route.RouteLocator;
import org.springframework.cloud.gateway.route.builder.RouteLocatorBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class ApiGatewayConfiguration {
    @Bean
    public RouteLocator gatewayRoutes(RouteLocatorBuilder builder) {
        return builder.routes()
                .route("siswa-service-route", r -> r.path("/api/siswa/**")
                        .uri("lb://siswa-service"))
                .route("guru-service-route", r -> r.path("/api/guru/**")
                        .uri("lb://guru-service"))
                .route("mapel-service-route", r -> r.path("/api/mapel/**")
                        .uri("lb://mapel-service"))
                .route("kelas-service-route", r -> r.path("/api/kelas/**")
                        .uri("lb://kelas-service"))
                .route("auth-service-route", r -> r.path("/api/auth/**")
                        .uri("lb://auth-service"))
                .build();
    }
}
