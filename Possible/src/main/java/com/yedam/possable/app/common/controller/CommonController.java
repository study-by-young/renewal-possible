package com.yedam.possable.app.common.controller;

import com.yedam.possable.app.common.domain.ModelCodeVO;
import com.yedam.possable.app.common.domain.TrimCodeVO;
import com.yedam.possable.app.common.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
public class CommonController {
    @Autowired
    CodeMapper codeMapper;

    @GetMapping("/findModels")
    public List<ModelCodeVO> findModels(@RequestParam("brand") String brand){
        return codeMapper.getModels(brand);
    }

    @GetMapping("/findTrims")
    public List<TrimCodeVO> findTrims(@RequestParam("model") String model){
        return codeMapper.getTrims(model);
    }
}
