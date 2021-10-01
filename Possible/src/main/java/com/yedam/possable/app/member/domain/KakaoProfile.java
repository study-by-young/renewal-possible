package com.yedam.possable.app.member.domain;

import lombok.Data;

@Data
public class KakaoProfile {

	public Integer id;
	public String connectedAt;
	public Properties properties;
	public KakaoAccount kakaoAccount;
	
	@Data
	class Properties {

		public String nickname;

	}
	@Data
	class KakaoAccount {

		public Boolean profileNicknameNeedsAgreement;
		public Profile profile;
		public Boolean hasEmail;
		public Boolean emailNeedsAgreement;
		public Boolean isEmailValid;
		public Boolean isEmailVerified;
		public String email;
		public Boolean hasAgeRange;
		public Boolean ageRangeNeedsAgreement;
		public String ageRange;
		public Boolean hasBirthday;
		public Boolean birthdayNeedsAgreement;
		public String birthday;
		public String birthdayType;

		@Data
		class Profile {
			
			public String nickname;

		}
	}
}
