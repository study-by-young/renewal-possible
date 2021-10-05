package com.yedam.possable.app.common.code.controller;

import com.yedam.possable.app.common.code.domain.ModelCodeVO;
import com.yedam.possable.app.common.code.domain.TrimCodeVO;
import com.yedam.possable.app.common.code.service.CodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class CodeController {
    @Autowired
    CodeService codeService;

    @GetMapping("/findModels")
    public List<ModelCodeVO> findModels(@RequestParam("brand") String brand){
        return codeService.getModelList(brand);
    }

    @GetMapping("/findTrims")
    public List<TrimCodeVO> findTrims(@RequestParam("model") String model){
        return codeService.getTrimList(model);
    }
}
