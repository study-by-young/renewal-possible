package com.yedam.possable.app.community.qna.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;
import com.yedam.possable.app.community.qna.service.QnaAnswerService;

@RestController
@RequestMapping("/answer/*")
public class QnaAnswerController {
	
	@Autowired QnaAnswerService qnaAnswerService;
	
	@GetMapping("/")
	public List<QnaAnswerVO> getList(@RequestParam("seq") Long qnaSeq) {
		return qnaAnswerService.getList(qnaSeq);
	}
	
	@PostMapping("/")
	public List<QnaAnswerVO> insert(QnaAnswerVO vo, @RequestParam("seq") Long qnaSeq) {
		qnaAnswerService.insert(vo);
		return qnaAnswerService.getList(qnaSeq);
	}
	
	@PutMapping("/")
	public List<QnaAnswerVO> update(@RequestBody QnaAnswerVO vo, @RequestParam("seq") Long qnaSeq) {
		qnaAnswerService.update(vo);
		return qnaAnswerService.getList(qnaSeq);
	}
	
	@DeleteMapping("/{seq}")
	public boolean delete(@PathVariable Long seq, QnaAnswerVO vo) {
		vo.setSeq(seq);
		int q = qnaAnswerService.delete(vo);
		return q== 1 ? true: false;
	}
	
	

}
