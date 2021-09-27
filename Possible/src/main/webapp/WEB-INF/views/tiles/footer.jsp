<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-23
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="${pageContext.request.contextPath}/resources/js/plugins/extensions/jquery_ui/widgets.min.js"></script>

	<!-- x footer Wrapper Start -->
	<div class="x_footer_top_main_wrapper float_left border-top border-bottom">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="x_footer_top_right">
						<div class="x_footer_top_title_box x_footer_top_title_box1">
							<div class="x_footer_top_title_box_icon_cont">
                                <a href="#information" data-toggle="modal">회사소개</a>
							</div>
                            <div id="information" class="modal fade" tabindex="-1">
                                <div class="modal-dialog modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3 class="modal-title">회사소개</h3>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <div class="modal-body">
                                            <h6 class="font-weight-semibold">Text in a modal</h6>
                                            <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
						<div class="x_footer_top_title_box">
                            <div class="x_footer_top_title_box_icon_cont">
                                <a href="#usePolicy" data-toggle="modal">이용약관</a>
                            </div>
                            <div id="usePolicy" class="modal fade" tabindex="-1">
                                <div class="modal-dialog modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3 class="modal-title">이용약관</h3>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <div class="modal-body">
                                            <h6 class="font-weight-semibold">Text in a modal</h6>
                                            <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>

                                            <hr>

                                            <h6 class="font-weight-semibold">Another paragraph</h6>
                                            <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
                                            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
						</div>
						<div class="x_footer_top_title_box">
                            <div class="x_footer_top_title_box_icon_cont x_footer_top_title_box_icon_cont_first">
                                <a href="#personalPolicy" data-toggle="modal">개인정보처리약관</a>
                            </div>
                            <div id="personalPolicy" class="modal fade" tabindex="-1">
                                <div class="modal-dialog modal-dialog-scrollable">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <h3 class="modal-title">개인정보처리약관</h3>
                                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                                        </div>

                                        <div class="modal-body">
                                            <h6 class="font-weight-semibold">Text in a modal</h6>
                                            <p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>

                                            <hr>

                                            <h6 class="font-weight-semibold">Another paragraph</h6>
                                            <p>Cras mattis consectetur purus sit amet fermentum. Cras justo odio, dapibus ac facilisis in, egestas eget quam. Morbi leo risus, porta ac consectetur ac, vestibulum at eros.</p>
                                            <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor.</p>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
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
	<!-- x footer Wrapper End -->
    <div class="container">
        <div class="row no-gutters justify-content-center">
            <div class="col-auto">
                <button type="button" class="btn btn-float m-0">
                    <i class="icon-facebook2 text-grey-600 icon-2x"></i>
                </button>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-float m-0">
                    <i class="icon-instagram text-grey-600 icon-2x"></i>
                </button>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-float m-0">
                    <i class="icon-twitter text-grey-600 icon-2x"></i>
                </button>
            </div>
            <div class="col-auto">
                <button type="button" class="btn btn-float m-0">
                    <i class="icon-youtube text-grey-600 icon-2x"></i>
                </button>
            </div>
        </div>
    </div>

    <div class="float_left padding_tb_100">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="wrap-album-slider">
                        <div class="bx-wrapper" style="max-width: 1653px;"><div class="bx-viewport" style="width: 100%; overflow: hidden; position: relative; height: 107px;"><ul class="album-slider" style="width: 11215%; position: relative; left: -924.897px;">
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt1.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt2.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt3.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt4.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt5.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt6.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt1.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt2.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt3.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt4.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt5.png" alt="img">
                                </figure>
                            </li>
                            <li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                                <figure class="album">
                                    <img src="images/prt1.png" alt="img">
                                </figure>
                            </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt2.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt3.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt4.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt5.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt6.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt1.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt2.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt3.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt4.png" alt="img">
                            </figure>
                        </li><li class="album-slider__item bx-clone" style="float: left; list-style: none; position: relative; width: 150px; margin-right: 17px;">
                            <figure class="album">
                                <img src="images/prt5.png" alt="img">
                            </figure>
                        </li></ul></div></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="x_copyr_main_wrapper bg-primary float_left">
		<a href="javascript:" id="return-to-top"><i class="fa fa-arrow-up"></i></a>
		<div class="container">
			<p>Copyright © 2018 Expedia. All rights reserved.</p>
		</div>
	</div>
