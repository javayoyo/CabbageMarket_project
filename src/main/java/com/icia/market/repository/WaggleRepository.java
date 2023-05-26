package com.icia.market.repository;

import com.icia.market.dto.WaggleDTO;
import com.icia.market.dto.WaggleFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public class WaggleRepository {

    @Autowired
    private SqlSessionTemplate sql;

    public WaggleDTO save(WaggleDTO waggleDTO) {
        System.out.println("insert 전 waggleDTO = " + waggleDTO);
        sql.insert("Waggle.save", waggleDTO);
        System.out.println("insert 후 waggleDTO = " + waggleDTO);
        return waggleDTO;
    }

    public List<WaggleDTO> findAll() {
        return sql.selectList("Waggle.findAll");
    }

    public void updateHits(Long id) {
        sql.update("Waggle.updateHits", id);
    }

    public WaggleDTO findById(Long id) {
        return sql.selectOne("Waggle.findById", id);
    }

    public void update(WaggleDTO boardDTO) {
        sql.update("Waggle.update", boardDTO);
    }

    public void saveFile(WaggleFileDTO waggleFileDTO) {
        sql.insert("Waggle.saveFile", waggleFileDTO);
    }

    public List<WaggleFileDTO> findFile(Long boardId) {
        return sql.selectList("Waggle.findFile", boardId);
    }

    public List<WaggleDTO> pagingList(Map<String, Integer> pagingParams) {
        return sql.selectList("Waggle.paging", pagingParams);
    }

    public int boardCount() {
        return sql.selectOne("Waggle.count");
    }

    public List<WaggleDTO> searchList(Map<String, Object> pagingParams) {
        return sql.selectList("Waggle.search", pagingParams);
    }

    public int boardSearchCount(Map<String, Object> pagingParams) {
        return sql.selectOne("Waggle.searchCount", pagingParams);

    }


    public void delete(Long id) {
        sql.delete("Waggle.delete", id);
    }
}



