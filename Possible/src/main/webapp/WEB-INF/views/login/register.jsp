<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
.register_wrapper_box {
    float: left;
    width: 100%;
    background: #ffffff;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    padding: 50px;
    margin-bottom: 20px;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
}
.card {
	float : left;
	width: 100%;
	background: #ffffff;
	box-shadow: 0 4px 10px rgb(0 0 0 / 10%);
	padding: 50px;
	margin-bottom: 20px;
	border-radius: 5px;
}
</style>
<div class="x_partner_main_wrapper float_left padding_tb_100">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="x_offer_car_heading_wrapper float_left">
						<h4>Register Got Your Account</h4>
						<h3>회원가입</h3>
					</div>
				</div>
			</div>
			<div class="row">
               <div class="col-xl-8 offset-xl-2 col-lg-8 offset-lg-2 col-md-12 col-sm-12 col-12">
                   <div class="row">
                   		 <div class="card">
                        	<h3 class="card-title text-center mb-5 fw-light fs-5">여행갈카 회원가입</h3>
                        	<div class="card-body">
                        		<form id="frm" name="frm">
                        			
                        			<div class="row">
	                        			<div class="form-group col-md-12 col-sm-6 col-xs-12">
	                                		<label for="InputEmail">아이디 입력*</label>
	                                    	<input type="text" class="form-control" name="id" value="" placeholder="아이디입력">
	                               		</div>
                        			</div>
  									<div class="row">
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="InputId">비밀번호</label>
	                                    	<input type="password" class="form-control"  name="field-name" value="" placeholder="password*">
  										</div>
  										<div class="form-group col-md-6 col-sm-3">
  											<label for="InputId">비밀번호 확인</label>
	                                    	<input type="password" class="form-control" name="field-name" value="" placeholder="re-enter password*">
	                                	</div>
	                                </div>
	                                <div class="form-row">
	                                	<div class="form-group col-md-4 col-sm-6 col-xs-12">
											<select name="brthdyYear" id="brthdyYear" class="selectpicker">
												<option value="" selected="selected">선택</option>
												<option value="1931">1931</option><option value="1932">1932</option><option value="1933">1933</option>
												<option value="1934">1934</option><option value="1935">1935</option><option value="1936">1936</option>
												<option value="1937">1937</option><option value="1938">1938</option><option value="1939">1939</option>
												<option value="1940">1940</option><option value="1941">1941</option><option value="1942">1942</option>
												<option value="1943">1943</option><option value="1944">1944</option><option value="1945">1945</option>
												<option value="1946">1946</option><option value="1947">1947</option><option value="1948">1948</option>
												<option value="1949">1949</option><option value="1950">1950</option><option value="1951">1951</option>
												<option value="1952">1952</option><option value="1953">1953</option><option value="1954">1954</option>
												<option value="1955">1955</option><option value="1956">1956</option><option value="1957">1957</option>
												<option value="1958">1958</option><option value="1959">1959</option><option value="1960">1960</option>
												<option value="1961">1961</option><option value="1962">1962</option><option value="1963">1963</option>
												<option value="1964">1964</option><option value="1965">1965</option><option value="1966">1966</option>
												<option value="1967">1967</option><option value="1968">1968</option><option value="1969">1969</option>
												<option value="1970">1970</option><option value="1971">1971</option><option value="1972">1972</option>
												<option value="1973">1973</option><option value="1974">1974</option><option value="1975">1975</option>
												<option value="1976">1976</option><option value="1977">1977</option><option value="1978">1978</option>
												<option value="1979">1979</option><option value="1980">1980</option><option value="1981">1981</option>
												<option value="1982">1982</option><option value="1983">1983</option><option value="1984">1984</option>
												<option value="1985">1985</option><option value="1986">1986</option><option value="1987">1987</option>
												<option value="1988">1988</option><option value="1989">1989</option><option value="1990">1990</option>
												<option value="1991">1991</option><option value="1992">1992</option><option value="1993">1993</option>
												<option value="1994">1994</option><option value="1995">1995</option><option value="1996">1996</option>
												<option value="1997">1997</option><option value="1998">1998</option><option value="1999">1999</option>
												<option value="2000">2000</option><option value="2001">2001</option><option value="2002">2002</option>
											</select>
											<span class="letter">년</span>
										</div>
										<div class="form-group col-md-4 col-sm-4 col-xs-12">
											<select name="brthdyMonth" id="brthdyMonth" class="selectpicker">
												<option value="" selected="selected">선택</option>
												<option value="01">1</option><option value="02">2</option><option value="03">3</option>
												<option value="04">4</option><option value="05">5</option><option value="06">6</option>
												<option value="07">7</option><option value="08">8</option><option value="09">9</option>
												<option value="10">10</option><option value="11">11</option><option value="12">12</option>
											</select>
											<span class="letter">월</span>
										</div>
									
									<select name="brthdyDay" id="brthdyDay" class="w130"><option value="" selected="selected">선택</option><option value="01">1</option><option value="02">2</option><option value="03">3</option><option value="04">4</option><option value="05">5</option><option value="06">6</option><option value="07">7</option><option value="08">8</option><option value="09">9</option><option value="10">10</option><option value="11">11</option><option value="12">12</option><option value="13">13</option><option value="14">14</option><option value="15">15</option><option value="16">16</option><option value="17">17</option><option value="18">18</option><option value="19">19</option><option value="20">20</option><option value="21">21</option><option value="22">22</option><option value="23">23</option><option value="24">24</option><option value="25">25</option><option value="26">26</option><option value="27">27</option><option value="28">28</option><option value="29">29</option><option value="30">30</option></select><span class="letter">일</span>
									</div>
	                                
  	                      		</form>
                        	</div>
                   		</div>
                            
                               
                                <!--Form Group-->
                              
	                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
	                                    <input type="password" name="field-name" value="" placeholder="password*">
	                                </div>
	                                
	                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
	                                    <input type="password" name="field-name" value="" placeholder="re-enter password*">
	                                </div>
                              

                                <!--Form Group-->
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="field-name" value="" placeholder="phone">
                                </div>

                                <!--Form Group-->
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="field-name" value="" placeholder="company name">
                                </div>

                                <!--Form Group-->
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="field-name" value="" placeholder="website">
                                </div>
                                
                                <!--Form Group-->
                                <div class="form-group col-md-6 col-sm-6 col-xs-12">
                                    <input type="text" name="field-name" value="" placeholder="address line">
                                </div>

                                <div class="form-group col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                    <div class="check-box text-center">
                                        <input type="checkbox" name="shipping-option" id="account-option_2"> &ensp;
                                        <label for="account-option_2" class="label_2">I agreed to the <a href="#" class="check_box_anchr">Terms and Conditions</a> governing the use of weapon store</label>
                                    </div>
                                </div>
                            </form>
                            </div>
                            </div>
                            </div>

                            <div class="login_btn_wrapper register_btn_wrapper login_wrapper register_wrapper_btn">
                                <a href="#" class="btn btn-primary login_btn"> register </a>
                            </div>
                            <div class="login_message">
                                <p>Already a member? <a href="login.html"> Login Here </a> </p>
                            </div>

                        </div>

                    </div>
                    <p class="btm_txt_register_form">In case you are using a public/shared computer we recommend that you logout to prevent any un-authorized access to your account</p>
                        <!-- /.login_wrapper-->
                