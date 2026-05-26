package com.url.shortener.repository;

import com.url.shortener.domain.ShortUrl;
import com.url.shortener.domain.User;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface ShortUrlRepository extends JpaRepository<ShortUrl, Long> {

    Optional<ShortUrl> findByShortCodeAndDeletedAtIsNull(String shortCode);

    boolean existsByShortCodeAndDeletedAtIsNull(String shortCode);

    Page<ShortUrl> findByUserAndDeletedAtIsNull(User user, Pageable pageable);

    Optional<ShortUrl> findByLongUrlAndUserAndDeletedAtIsNull(String longUrl, User user);
}
