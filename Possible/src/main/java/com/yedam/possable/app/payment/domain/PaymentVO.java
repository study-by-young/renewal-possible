package com.yedam.possable.app.payment.domain;

import lombok.Data;

@Data
public class PaymentVO {
	private String mdUid; /* 주문번호 */
	private String name; /* 주문명 */
	private Long amount; /* 결제금액 */
	private String method; /* 주문방법 */
	private String buyerName; /* 주문자 이름 */
	private String buyerTel; /* 주문자 연락처 */
	private Long memSeq; /* 실제로 넣는다면 MemberVO 타입으로 */
}






