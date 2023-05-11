package com.possible.community.qna_finish_delete.controller;

import com.possible.community.qna_finish_delete.service.QnaAnswerService;
import com.yedam.possable.app.community.qna.domain.QnaAnswerVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/answer/*")
public class QnaAnswerController {
	
	// RestController -> Mapping 종류를 다르게 해서 기능을 구분한다.
	
	@Autowired
	QnaAnswerService qnaAnswerService;
	
	// 전체조회(해당 문의의 답변만 조회)
	@GetMapping("/")
	public List<QnaAnswerVO> getList(@RequestParam Long qnaSeq) {
		return qnaAnswerService.getList(qnaSeq);
	}
	
	// 단건조회 (답변의 seq를 파라미터로 받아서 조회한다.)
	@GetMapping("/{seq}")
	public QnaAnswerVO read(@PathVariable Long seq, QnaAnswerVO vo) {
		vo.setSeq(seq);
		return qnaAnswerService.read(vo);
	}
	
	@PostMapping("/")
	public QnaAnswerVO insert(QnaAnswerVO vo) {
		qnaAnswerService.insert(vo);
		return qnaAnswerService.read(vo);
	}
	
	@PutMapping("/")
	public QnaAnswerVO update(@RequestBody QnaAnswerVO vo) {
		qnaAnswerService.update(vo);
		return qnaAnswerService.read(vo);
	}
	
	// 삭제 (답변의 seq를 파라미터로 받아서 삭제한다.)
	@DeleteMapping("/{seq}")
	public boolean delete(@PathVariable Long seq, QnaAnswerVO vo) {
		vo.setSeq(seq);
		int q = qnaAnswerService.delete(vo);
		return q == 1 ? true : false;
		// delete(vo)가 정상실행 되면 1을 반환, 1이 반환되면 true, 정상실행 되지 않으면 false.
	}

}
