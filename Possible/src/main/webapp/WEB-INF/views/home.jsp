<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="${pageContext.request.contextPath}/resources/js/plugins/loaders/blockui.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/ui/ripple.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugins/media/fancybox.min.js"></script>

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
                                    <h2 data-animation="animated fadeInUp">See how it works for real<br>
                                        <span>Car Hire Start Form $20 Only</span></h2>
                                    <div class="hs_effect_btn">
                                        <ul>
                                            <li data-animation="animated flipInX"><a href="#">렌트하기<i class="icon-arrow-right8"></i></a>
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
        <div class="x_slider_form_main_wrapper float_left shadow">
            <div class="x_slider_form_heading_wrapper float_left">
                <h3>원하는 렌트카를 찾아보세요!</h3>
            </div>
            <div class="row">
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                    <div class="x_slider_form_input_wrapper float_left">
                        <h3>픽업 장소</h3>
                        <input type="text" placeholder="주소 받을 곳(주소 API)">
                    </div>
                </div>
                <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                    <div class="x_slider_form_input_wrapper float_left">
                        <h3>반납 장소</h3>
                        <input type="text" placeholder="주소 받을 곳(주소 API)">
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-sec-header">
                        <h3>렌트 시작 날짜</h3>
                        <label class="cal-icon">Pick-up Date
                            <input type="text" placeholder="원하는 날짜를 선택하세요" class="form-control datepicker">
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="form-sec-header">
                        <h3>렌트 종료 날짜</h3>
                        <label class="cal-icon">Pick-up Date
                            <input type="text" placeholder="원하는 날짜를 선택하세요" class="form-control datepicker">
                        </label>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="x_slider_select">
                        <select class="myselect">
                            <option>09</option>
                            <option>13</option>
                            <option>17</option>
                        </select>	<i class="fa fa-clock-o"></i>
                    </div>
                    <div class="x_slider_select x_slider_select2">
                        <select class="myselect">
                            <option>00</option>
                            <option>30</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="x_slider_select">
                        <select class="myselect">
                            <option>09</option>
                            <option>13</option>
                            <option>17</option>
                        </select>	<i class="fa fa-clock-o"></i>
                    </div>
                    <div class="x_slider_select x_slider_select2">
                        <select class="myselect">
                            <option>00</option>
                            <option>10</option>
                            <option>20</option>
                            <option>30</option>
                            <option>40</option>
                            <option>50</option>
                        </select>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="x_slider_checkbox_bottom float_left">
                        <div class="x_slider_checout_right">
                            <ul>
                                <li><a href="#">렌트카 검색 <i class="icon-arrow-right8"></i></a>
                                </li>
                            </ul>
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
            <h3>여행지 <br>
                둘러보기</h3>
            <p>많고 많은 여행지, 어딜가야할지 고민된다면? 여행갈카에서 제공해드리는 여행지 안내를 참고해보세요!</p>
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

<div class="x_counter_main_wrapper">
    <div class="x_counter_img_overlay bg-indigo-600"></div>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="x_counter_car_heading_wrapper float_left">
                    <h4>Premium Rent</h4>
                    <h3>여행 준비 중이신가요?</h3>
                    <p>생각보다 준비 할게 많은 여행 누군가가 대신 해주면 좋겠죠?
                        <br>여행갈카에서는 고객님이 원하시는 여행 용품을 준비해드립니다!</p>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="x_cou_main_box_wrapper">
                    <div class="x_icon"> <i class="icon-compose"></i>
                    </div>
                    <h5><span>1.</span> <a href="#">견적 요청서 작성</a></h5>
                    <p>원하시는 차, 옵션, 여행용품, 기간 등을 작성해 업체에게 견적을 요청합니다.</p>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="x_cou_main_box_wrapper">
                    <div class="x_icon"> <i class="icon-list3"></i>
                    </div>
                    <h5><span>2.</span> <a href="#">견적 작성</a></h5>
                    <p>고객님이 작성하신 견적을 보고 업체들이 견적서를 작성합니다.</p>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="x_cou_main_box_wrapper">
                    <div class="x_icon"> <i class="icon-search4"></i>
                    </div>
                    <h5><span>3.</span> <a href="#">견적 선택</a></h5>
                    <p>마음에 드는 견적을 찾아 내용을 확인하고 결제합니다.</p>
                </div>
            </div>
            <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                <div class="x_cou_main_box_wrapper x_cou_main_box_wrapper_last">
                    <div class="x_icon"> <i class="flaticon-sedan-car-front"></i>
                    </div>
                    <h5><span>4.</span> <a href="#">차량 수령</a></h5>
                    <p>끝났습니다! 작성한 날짜와 장소에서 차량을 수령합니다. 즐거운 여행되세요!</p>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container x_counter_main_wrapper">
    <!-- Image grid -->
    <div class="mb-3 text-center">
        <h1 class="mb-0 font-weight-bold">
            여행갈카 이용 리뷰
        </h1>
        <span class="text-muted d-block">여행갈카의 소중한 고객님들의 리뷰입니다.</span>
    </div>

    <div class="row">
        <c:forEach begin="1" end="3">
            <div class="col-sm-12 col-lg-4">
                <div class="card">
                    <div class="card-img-actions mx-1 mt-1">
                        <img class="card-img img-fluid" src="${pageContext.request.contextPath}/resources/images/placeholder.jpg" alt="">
                        <div class="card-img-actions-overlay card-img">
                            <a href="${pageContext.request.contextPath}/resources/images/placeholder.jpg" class="btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round" data-popup="lightbox" rel="group">
                                <i class="icon-zoomin3"></i>
                            </a>
                        </div>
                    </div>

                    <div class="card-body">
                        <div>
                            <div>
                                <div>
                                    <h6 class="font-weight-semibold">
                                        <a href="#">
                                            너무 좋은 여행이었어요!
                                        </a>
                                        <span class="float-right main-score-bg"><span class="main-score" style="width:80%"></span></span>
                                    </h6>
                                </div>
                                <hr>
                                <span class="small">어디 갔는데 너무 좋았어요. 그냥 좋았어요~</span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- /image grid -->
</div>
<div class="line"></div>
<div class="x_counter_main_wrapper">
    <!-- Content area -->
    <div class="container">
        <!-- Questions title -->
        <div class="text-center mb-3 py-2">
            <h4 class="font-weight-semibold mb-1">자주 하는 질문</h4>
            <span class="text-muted d-block">원하시는 답변을 찾지 못하셨다면 고객센터로 연락해주세요!</span>
        </div>
        <!-- /questions title -->

        <div class="row">
            <c:forEach begin="1" end="4" varStatus="status">
                <div class="col-md-6">
                    <div class="card mb-2">
                        <div class="card-header">
                            <h6 class="card-title">
                                <a class="text-default collapsed" data-toggle="collapse" href="#question${status.index}">
                                    <i class="icon-help mr-2 text-slate"></i> A without walking some objective?
                                </a>
                            </h6>
                        </div>

                        <div id="question${status.index}" class="collapse">
                            <div class="card-body">
                                She exposed painted fifteen are noisier mistake led waiting. Surprise not wandered speedily husbands although yet end. Are court tiled cease young built fat one man taken. We highest ye friends is exposed equally in. Ignorant had too strictly followed. Astonished as travelling assistance or unreserved oh pianoforte ye. Five with seen put need tore add neat.
                            </div>

                            <div class="card-footer bg-transparent d-sm-flex align-items-sm-center border-top-0 pt-0">
                                <span class="text-muted">Latest update: May 25, 2015</span>

                                <ul class="list-inline text-nowrap mb-0 ml-auto mt-2 mt-sm-0">
                                    <li class="list-inline-item"><a href="#" class="text-primary mr-2"><i class="icon-thumbs-up2"></i></a> 320</li>
                                    <li class="list-inline-item"><a href="#" class="text-muted mr-2"><i class="icon-thumbs-down2"></i></a> 14</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
    <!-- /content area -->
</div>

<script>
    // Setup module
    // ------------------------------
    var Gallery = function() {

        //
        // Setup module components
        //

        // Lightbox
        var _componentFancybox = function() {
            if (!$().fancybox) {
                console.warn('Warning - fancybox.min.js is not loaded.');
                return;
            }

            // Image lightbox
            $('[data-popup="lightbox"]').fancybox({
                padding: 3
            });
        };

        //
        // Return objects assigned to module
        //

        return {
            init: function() {
                _componentFancybox();
            }
        }
    }();

    // Initialize module
    // ------------------------------
    document.addEventListener('DOMContentLoaded', function() {
        Gallery.init();
    });
</script>
