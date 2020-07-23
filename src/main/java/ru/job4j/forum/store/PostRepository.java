package ru.job4j.forum.store;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import org.springframework.transaction.annotation.Transactional;
import ru.job4j.forum.model.Post;

public interface PostRepository extends CrudRepository<Post, Integer> {

    @Transactional
    @Modifying
    @Query("update ru.job4j.forum.model.Post set name = :name, description = :desc where id = :id")
    void updateNameDesc(int id, String name, String desc);
}