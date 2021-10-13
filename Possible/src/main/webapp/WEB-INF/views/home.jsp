<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!-- hs Slider Start -->
<div class="slider-area mb-4 mb-lg-5">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <div class="carousel-inner" role="listbox">
            <div class="d-flex align-items-center carousel-item active">
                <div class="flex-1 carousel-captions caption-1">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="content">
                                    <h2 class="font-weight-bold" data-animation="animated fadeInUp" style="font-size: 2.5rem">SHALL WE TRIP?<br>
                                        <span>여행갈카에 오신 것을 환영합니다!</span></h2>
                                    <div class="bg-white d-inline-block rounded">
                                        <a href="${pageContext.request.contextPath}/commonRent" class="h6 btn btn-lg btn-outline-primary m-0">렌트하기<i class="icon-arrow-right8"></i></a>
                                    </div>
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
<div class="mb-4 mb-lg-5">
    <div class="container">
        <div class="bg-white rounded-lg shadow">
            <div class="page-header">
                <div class="page-header-content bg-indigo-400 header-elements-inline rounded-top">
                    <div class="py-3">
                        <span class="h3 font-weight-bold">멋진 차들이 기다리고 있어요! <i class="fas fa-car-side"></i></span>
                    </div>
                </div>
            </div>
            <form name="searchCar" action="commonRent/list" onsubmit="">
                <div class="row p-3">
                    <div class="col-md-3">
                        <h6>지역</h6>
                        <div class="form-group">
                            <select id="searchArea" name="searchArea" class="form-control select">
                                <c:forEach var="area" items="${areaCodes}">
                                    <option value="${area.code}">${area.name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>

                    <div class="col-md-3">
                        <h6>대여 날짜</h6>
                        <div class="input-group mb-3">
                            <span class="input-group-prepend">
                                <span class="input-group-text"><i class="icon-calendar"></i></span>
                            </span>
                            <input type="text" id="start" name="start" class="form-control pickadate-format">
                        </div>
                    </div>
                    <div class="col-md-1 text-center align-self-center h5">
                        <p id="dateRange" class="badge badge-info ">7일</p>
                        <p><i class="icon-arrow-right8"></i></p>
                    </div>
                    <div class="col-md-3">
                        <h6>반납 날짜</h6>
                        <div class="input-group mb-3">
                            <span class="input-group-prepend">
                                <span class="input-group-text"><i class="icon-calendar"></i></span>
                            </span>
                            <input type="text" id="end" name="end" class="form-control pickadate-format">
                        </div>
                    </div>
                    <div class="col-md-2">
                        <button class="btn btn-primary h-100 w-100"><span class="h5 align-middle">렌트카 검색</span></button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- btc team Wrapper Start -->
<div class="my-4 my-lg-5">
    <div class="btc_team_main_wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 text-center text-md-left">
                    <h1 class="font-weight-bold">여행지 <br>
                        둘러보기</h1>
                    <hr class="border-2 border-primary">
                    <h6>많고 많은 여행지, 어딜가야할지 고민된다면? 여행갈카에서 제공해드리는 여행지 안내를 참고해보세요!</h6>
                </div>
                <div class="col-md-9">
                    <div class="btc_team_slider_wrapper">
                        <div class="owl-carousel owl-theme">
                            <c:forEach var="tour" items="${tourList}" begin="0" end="4">
                                <div class="item shadow-sm">
                                    <div class="btc_team_slider_cont_main_wrapper">
                                        <div class="btc_team_img_wrapper">
                                            <img src="<c:out value="${tour.firstImage}" default="resources/images/t1.jpg" />" alt="team_img1">
                                        </div>
                                        <div class="btc_team_img_cont_wrapper bg-white py-2 px-2">
                                            <h4 class="font-weight-bold"><a href="#" class="text-dark">${tour.title}</a></h4>
                                            <p>${tour.addr1}</p>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="x_counter_main_wrapper text-center bg-indigo-600">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="x_counter_car_heading_wrapper float_left">
                        <h4>Premium Rent</h4>
                        <h6 class="display-5 font-weight-bold">여행 준비 중이신가요?</h6>
                        <h6 class="text-white-50">생각보다 준비 할게 많은 여행 누군가가 대신 해주면 좋겠죠?
                            <br>여행갈카에서는 고객님이 원하시는 여행 용품을 준비해드립니다!</h6>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="x_cou_main_box_wrapper mt-4">
                        <div class="x_icon x_icon rounded-circle border-2"> <i class="icon-compose icon-2x"></i>
                        </div>
                        <h4 class="font-weight-bold pt-4"><span>1.</span>견적 요청서 작성</h4>
                        <p>원하시는 차, 옵션, 여행용품, 기간 등을 작성해 업체에게 견적을 요청합니다.</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="x_cou_main_box_wrapper mt-4">
                        <div class="x_icon x_icon rounded-circle border-2"> <i class="icon-list3 icon-2x"></i>
                        </div>
                        <h4 class="font-weight-bold pt-4"><span>2.</span>견적 작성</h4>
                        <p>고객님이 작성하신 견적을 보고 업체들이 견적서를 작성합니다.</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="x_cou_main_box_wrapper mt-4">
                        <div class="x_icon x_icon rounded-circle border-2"> <i class="icon-search4 icon-2x"></i>
                        </div>
                        <h4 class="font-weight-bold pt-4"><span>3.</span>견적 선택</h4>
                        <p>마음에 드는 견적을 찾아 내용을 확인하고 결제합니다.</p>
                    </div>
                </div>
                <div class="col-xl-3 col-lg-3 col-md-6 col-sm-12 col-12">
                    <div class="x_cou_main_box_wrapper mt-4">
                        <div class="x_icon x_icon rounded-circle border-2"> <i class="fas fa-car fa-2x"></i>
                        </div>
                        <h4 class="font-weight-bold pt-4"><span>4.</span>차량 수령</h4>
                        <p>끝났습니다! 작성한 날짜와 장소에서 차량을 수령합니다. 즐거운 여행되세요!</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- btc team Wrapper End -->



<div class="main-review-card-wrapper container">
    <!-- Image grid -->
    <div class="p-2 mb-3 text-center bg-white shadow-sm rounded-lg">
        <h1 class="display-5 font-weight-bold text-primary">
            여행갈카 이용 후기
        </h1>
        <span class="d-block">고객님들의 소중한 이용 후기입니다.</span>
    </div>

    <div class="row card-deck flex-wrap mb-sm-3 px-2">
        <c:forEach begin="0" end="3">
            <div class="col-lg-3 col-md-6">
                <div class="card mx-0 mb-3" style="flex:none">
                    <div class="card-img-actions mx-1 mt-1">
                        <img class="card-img-top img-fluid" src="${pageContext.request.contextPath}/resources/images/placeholder.jpg" alt="">
                        <div class="card-img-actions-overlay card-img">
                            <a href="${pageContext.request.contextPath}/resources/images/placeholder.jpg" class="btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round" data-popup="lightbox" rel="group">
                                <i class="icon-zoomin3"></i>
                            </a>
                        </div>
                    </div>

                    <div class="card-body">
                        <h5 class="card-title">
                            <a href="#">너무 좋은 여행이었어요!</a>
                        </h5>
                        <p class="card-text">어디 갔는데 너무 좋았어요. 그냥 좋았어요~</p>
                    </div>

                    <div class="card-footer d-flex justify-content-between">
                        <span class="text-muted"><i class="far fa-clock"></i> 21/10/09</span>
                        <span class="float-right main-score-bg"><span class="main-score" style="width:80%"></span></span>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
    <!-- /image grid -->
</div>


<div class="x_counter_main_wrapper">
    <!-- Content area -->
    <div class="container">
        <!-- Questions title -->
        <div class="text-center mb-3 py-2">
            <h4 class=" display-5 font-weight-bold mb-1">자주 하는 질문</h4>
            <span class="text-muted d-block">원하시는 답변을 찾지 못하셨다면 고객센터로 연락해주세요!</span>
        </div>
        <!-- /questions title -->

        <div class="row">
            <c:forEach var="faq" items="${faqList}" varStatus="status">
                <div class="col-md-6">
                    <div class="card mb-2">
                        <a class="text-default collapsed" data-toggle="collapse" href="#question${status.index}">
                            <div class="card-header">
                                <h6 class="card-title">

                                        <i class="icon-help mr-2 text-slate"></i> ${faq.title}
                                </h6>
                            </div>
                        </a>
                        <div id="question${status.index}" class="collapse">
                            <div class="card-body">
                                ${faq.content}
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
    let now = new Date();
    let defaultReturnDate = new Date();
    defaultReturnDate = defaultReturnDate.setDate((now.getDate() + 7))

    $(function(){
        initPickadate();
        initSilder();


    })

    function initPickadate(){
        let startPicker = $("#start").pickadate('picker');
        let endPicker = $("#end").pickadate('picker');

        startPicker.set('select', now);
        endPicker.set({
            min : 1,
            select : defaultReturnDate
        });

        startPicker.on('close', function(){
            let minDate = new Date(startPicker.get('select','yyyy,mm,dd'));
            minDate.setDate(minDate.getDate()+1);
            endPicker.set('min', minDate).set('clear');
            $('#dateRange').text('');
        });

        endPicker.on('close', function(){
            let minDate = startPicker.get('select','dd');
            let maxDate = endPicker.get('select','dd');
            let range = parseInt(maxDate) - parseInt(minDate);
            $('#dateRange').text(range + "일");
        })
    }

    function initSilder(){
        $('.btc_team_slider_wrapper .owl-carousel').owlCarousel({
            loop: true,
            margin: 10,
            dots: false,
            autoplay: true,
            responsiveClass: true,
            smartSpeed: 1200,
            navText: [
                '<div class="px-2 py-1"><i class="fas fa-chevron-left" aria-hidden="true"></i></div>',
                '<div class="px-2 py-1"><i class="fas fa-chevron-right" aria-hidden="true"></i></div>',
            ],
            responsive: {
                0: {
                    items: 1,
                },
                600: {
                    items: 2,
                },
                1000: {
                    items: 3,
                    margin: 20,
                },
            },
        });
    }
</script>
