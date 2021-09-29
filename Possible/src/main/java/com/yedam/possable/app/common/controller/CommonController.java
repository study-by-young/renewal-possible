package com.yedam.possable.app.common.controller;

import com.yedam.possable.app.common.domain.ModelCodeVO;
import com.yedam.possable.app.common.domain.TrimCodeVO;
import com.yedam.possable.app.common.mapper.CodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class CommonController {
    @Autowired
    CodeMapper codeMapper;

    @GetMapping("/findModels")
    @ResponseBody
    public List<ModelCodeVO> findModels(@RequestParam("brand") String brand){
        return codeMapper.getModels(brand);
    }

    @GetMapping("/findTrims")
    @ResponseBody
    public List<TrimCodeVO> findTrims(@RequestParam("model") String model){
        return codeMapper.getTrims();
    }
}
