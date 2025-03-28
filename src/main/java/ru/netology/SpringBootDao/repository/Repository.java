package ru.netology.SpringBootDao.repository;

import org.springframework.core.io.ClassPathResource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.List;
import java.util.stream.Collectors;


public class Repository {

    private final String scriptFileName = "getProductNames.sql";
    private final String requestLine = read(scriptFileName);
    private final NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public Repository (NamedParameterJdbcTemplate namedParameterJdbcTemplate) {
        this.namedParameterJdbcTemplate = namedParameterJdbcTemplate;
    }

    private static String read(String scriptFileName) {
        try (InputStream is = new ClassPathResource(scriptFileName).getInputStream();
             BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(is))) {
            return bufferedReader.lines().collect(Collectors.joining("\n"));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public List<String> getProductName(String name) {
        MapSqlParameterSource parameters = new MapSqlParameterSource("name", name);
        return namedParameterJdbcTemplate.queryForList(requestLine, parameters, String.class);
    }

}