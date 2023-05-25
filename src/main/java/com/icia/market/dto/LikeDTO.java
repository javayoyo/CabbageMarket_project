package com.icia.market.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString

public class LikeDTO {

private long id;
private String memberEmail;
private long boardId;
private int itLike;
private int count;
}
