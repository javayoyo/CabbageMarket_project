package com.icia.market.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Timestamp;
import java.util.List;

@Getter
@Setter
@ToString

public class WaggleDTO {
    private Long id;
    private String waggleTitle;
    private String waggleWriter;
    private String waggleContents;
    private int waggleHits;
    private Timestamp waggleCreatedDate;
    private int fileAttached;

    private List<MultipartFile> waggleFile;

    private Long memberId;

}