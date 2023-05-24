package com.icia.market.repository;

import com.icia.market.dto.WaggleDTO;
import com.icia.market.dto.WaggleFileDTO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

    public void saveFile(WaggleFileDTO waggleFileDTO) { sql.insert("Waggle.saveFile", waggleFileDTO);
    }
}
