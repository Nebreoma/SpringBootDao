package ru.netology.SpringBootDao.service;

import org.springframework.web.bind.annotation.RestController;
import ru.netology.SpringBootDao.repository.Repository;

import java.util.List;


@RestController
public class Service {
    private final Repository repository;

    public Service(Repository repository) {
        this.repository = repository;
    }

    public List<String> getProducts(String name) {
        return repository.getProductName(name);
    }
}