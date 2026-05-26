package com.url.shortener.repository;

import com.url.shortener.domain.ClickEvent;
import com.url.shortener.domain.ShortUrl;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ClickEventRepository extends JpaRepository<ClickEvent, Long> {

    List<ClickEvent> findByShortUrl(ShortUrl shortUrl);

    long countByShortUrl(ShortUrl shortUrl);
}
