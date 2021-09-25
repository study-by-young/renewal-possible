<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!-- hs Slider Start -->
<div class="slider-area">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="carousel-item active">
                <div class="carousel-captions caption-1">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <p data-animation="animated fadeInUp">Pick Your Car & Drive</p>
                                    <h2 data-animation="animated fadeInUp">See how it works for real<br>
                                        <span>Car Hire Start Form $20 Only</span></h2>
                                    <div class="hs_effect_btn">
                                        <ul>
                                            <li data-animation="animated flipInX">
                                                <a rel='external' href='https://www.youtube.com/embed/ryzOXAO0Ss0' title='title' class="test-popup-link">
                                                    <img src="images/play.png" alt="olay_icon">&nbsp;&nbsp;Play Video</a>
                                            </li>
                                            <li data-animation="animated flipInX"><a href="#">Book Car<i class="fa fa-arrow-right"></i></a>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- hs Slider End -->
<div class="x_responsive_form_wrapper">
    <div class="container">
        <div class="x_responsive_form_wrapper-bg" style="background-color: #f2f2f2">
            <div class="x_slider_form_main_wrapper float_left">
                <div class="x_slider_form_heading_wrapper float_left">
                    <h3>Let’s find your perfect car</h3>
                </div>
                <div class="row">
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="x_slider_form_input_wrapper float_left">
                            <h3>Pick-up Location</h3>
                            <input type="text" placeholder="City, Airport, Station, etc.">
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="x_slider_form_input_wrapper float_left">
                            <h3>Drop-off Location</h3>
                            <input type="text" placeholder="City, Airport, Station, etc.">
                        </div>
                    </div>
                    <div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
                        <div class="x_slider_checkbox float_left">
                            <input type="checkbox" id="c5" name="cb">
                            <label for="c5">Driver age is between 30-65 &nbsp;<i class="fa fa-question-circle"></i>
                            </label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-sec-header">
                            <h3>Pick-up Date</h3>
                            <label class="cal-icon">Pick-up Date
                                <input type="text" placeholder="Tue 16 Jan 2018" class="form-control datepicker">
                            </label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-sec-header">
                            <h3>Drop-Off Date</h3>
                            <label class="cal-icon">Pick-up Date
                                <input type="text" placeholder="Tue 16 Jan 2018" class="form-control datepicker">
                            </label>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="x_slider_select">
                            <select class="myselect">
                                <option>09</option>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                            </select>	<i class="fa fa-clock-o"></i>
                        </div>
                        <div class="x_slider_select x_slider_select2">
                            <select class="myselect">
                                <option>50</option>
                                <option>40</option>
                                <option>03</option>
                                <option>02</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="x_slider_select">
                            <select class="myselect">
                                <option>09</option>
                                <option>01</option>
                                <option>02</option>
                                <option>03</option>
                            </select>	<i class="fa fa-clock-o"></i>
                        </div>
                        <div class="x_slider_select x_slider_select2">
                            <select class="myselect">
                                <option>50</option>
                                <option>40</option>
                                <option>03</option>
                                <option>02</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <div class="x_slider_checkbox_bottom float_left">
                            <div class="x_slider_checout_left">
                                <ul>
                                    <li><i class="fa fa-check-circle"></i>&nbsp;&nbsp;24/7 Phone Support</li>
                                    <li><i class="fa fa-check-circle"></i>&nbsp;&nbsp;No Credit Card Fees</li>
                                    <li><i class="fa fa-check-circle"></i>&nbsp;&nbsp;No Amendment Fees</li>
                                </ul>
                            </div>
                            <div class="x_slider_checout_right">
                                <ul>
                                    <li><a href="#">search <i class="fa fa-arrow-right"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- btc team Wrapper Start -->
<div class="btc_team_main_wrapper">
    <div class="btc_team_img_overlay"></div>
    <div class="container">
        <div class="btc_team_left_wrapper">
            <h3>Featured <br>
                Destinations</h3>
            <p>Explore a different way to travel. This isot as hop's version of Lorem Ipsum. oin gra nibh vel velit auctor aliquet. nean sollicin, lorem quis.</p>
        </div>
        <div class="btc_team_right_wrapper">
            <div class="btc_team_slider_wrapper">
                <div class="owl-carousel owl-theme">
                    <div class="item">
                        <div class="btc_team_slider_cont_main_wrapper">
                            <div class="btc_team_img_wrapper">
                                <img src="${pageContext.request.contextPath}/resources/images/t1.jpg" alt="team_img1">
                                <div class="x_team_label_wrapper">
                                    <p>40% OFF</p>
                                </div>
                            </div>
                            <div class="btc_team_img_cont_wrapper">
                                <h4><a href="#">Paris, France</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="btc_team_slider_cont_main_wrapper">
                            <div class="btc_team_img_wrapper">
                                <img src="${pageContext.request.contextPath}/resources/images/t2.jpg" alt="team_img1">
                                <div class="x_team_label_wrapper">
                                    <p>40% OFF</p>
                                </div>
                            </div>
                            <div class="btc_team_img_cont_wrapper">
                                <h4><a href="#">los Angeles, usa</a></h4>
                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <div class="btc_team_slider_cont_main_wrapper">
                            <div class="btc_team_img_wrapper">
                                <img src="${pageContext.request.contextPath}/resources/images/t3.jpg" alt="team_img1">
                                <div class="x_team_label_wrapper">
                                    <p>40% OFF</p>
                                </div>
                            </div>
                            <div class="btc_team_img_cont_wrapper">
                                <h4><a href="#">Agra, india</a></h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- btc team Wrapper End -->
