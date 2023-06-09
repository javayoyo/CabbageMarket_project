package com.icia.market.repository;

import com.icia.market.dto.BoardDTO;
import com.icia.market.dto.BoardFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class BoardRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public BoardDTO save(BoardDTO boardDTO) {
        System.out.println("insert 전 boardDTO = " + boardDTO);
        sql.insert("Board.save", boardDTO);
        System.out.println("insert 후 boardDTO = " + boardDTO);
        return boardDTO;
    }

    public List<BoardDTO> findAll() {
        return sql.selectList("Board.findAll");
    }

    public void updateHits(Long id) {
        sql.update("Board.updateHits", id);
    }

    public BoardDTO findById(Long id) {
        return sql.selectOne("Board.findById", id);
    }

    public void update(BoardDTO boardDTO) {
        sql.update("Board.update", boardDTO);
    }

    public void saveFile(BoardFileDTO boardFileDTO) {
        sql.insert("Board.saveFile", boardFileDTO);
    }

    public List<BoardFileDTO> findFile(Long boardId) {
        return sql.selectList("Board.findFile" , boardId);
    }

    public List<BoardDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Board.paging", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Board.count");
    }

    public List<BoardDTO> searchList(Map<String, Object> pagingParams) {
        return sql.selectList("Board.search", pagingParams);
    }

    public int boardSearchCount(Map<String, Object> pagingParams) {
        return sql.selectOne("Board.searchCount", pagingParams);

    }


    public void delete(Long id) {
        sql.delete("Board.delete", id);
    }

//    public HeartDTO findHeart(Map<String, Long> number) {
//        return sql.selectOne("Board.findHeart",number);
//    }
//
//    // 좋아요가 DB에 있는지 확인
//    public HeartDTO findHeart(HeartDTO heart) {
//        return sql.selectOne("Board.findHeart2",heart);
//    }
//
//    // 좋아요 정보(heart_table에 게시글 번호, 회원 번호) 저장
//    public int insertHeart(HeartDTO heart) {
//        return sql.insert("Board.insertHeart", heart);
//    }
//
//    // 좋아요 삭제
//    public void deleteHeart(HeartDTO heart) {
//        sql.delete("Board.deleteHeart",heart);
//    }


}

