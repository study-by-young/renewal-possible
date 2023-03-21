<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2021-09-23
  Time: 오전 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style type="text/css">
* {
	box-sizing: border-box;
	padding: 0
}

.h5 {
	font-size: 1.0625rem;
}

.dropdown-toggle::after {
	font-family: icomoon;
	display: inline-block;
	border: 0;
	vertical-align: middle;
	font-size: .6875rem;
	margin-left: .46875rem;
	line-height: 0;
	position: relative;
	content: ""
}

.headroom {
	transition: box-shadow ease-in-out .2s, -webkit-transform ease-in-out
		.2s;
	transition: transform ease-in-out .2s, box-shadow ease-in-out .2s;
	transition: transform ease-in-out .2s, box-shadow ease-in-out .2s,
		-webkit-transform ease-in-out .2s;
	will-change: transform
}

.navbar {
	-ms-flex-align: stretch;
	align-items: stretch;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24)
}

.fixed-top {
	position: fixed;
	top: 0;
	right: 0;
	left: 0;
	z-index: 1030
}

.bg-white {
	background-color: #fff !important
}

.navbar {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: justify;
	justify-content: space-between;
	padding: 0 1.25rem
}

.navbar>.container, .navbar>.container-fluid {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-wrap: wrap;
	flex-wrap: wrap;
	-ms-flex-align: center;
	align-items: center;
	-ms-flex-pack: justify;
	justify-content: space-between
}

.navbar-brand {
	display: inline-block;
	padding-top: 1.00002rem;
	padding-bottom: 1.00002rem;
	margin-right: 1.25rem;
	font-size: 0;
	line-height: inherit;
	white-space: nowrap
}

.navbar-brand:focus, .navbar-brand:hover {
	text-decoration: none
}

.navbar-nav {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	padding-left: 0;
	margin-bottom: 0;
	list-style: none
}

.navbar-nav .nav-link {
	padding-right: 0;
	padding-left: 0
}

.navbar-nav .dropdown-menu {
	position: static;
	float: none
}

.navbar-text {
	display: inline-block;
	padding-top: .625rem;
	padding-bottom: .625rem
}

.navbar-collapse {
	-ms-flex-preferred-size: 100%;
	flex-basis: 100%;
	-ms-flex-positive: 1;
	flex-grow: 1;
	-ms-flex-align: center;
	align-items: center
}

.navbar-toggler {
	padding: .875rem 0;
	font-size: .8125rem;
	line-height: 1;
	background-color: transparent;
	border: 1px solid transparent;
	border-radius: 0
}

.navbar-toggler:focus, .navbar-toggler:hover {
	text-decoration: none
}

.navbar-toggler-icon {
	display: inline-block;
	width: 1.5em;
	height: 1.5em;
	vertical-align: middle;
	content: "";
	background: no-repeat center center;
	background-size: 100% 100%
}

@media ( max-width :575.98px) {
	.navbar-expand-sm>.container, .navbar-expand-sm>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :576px) {
	.navbar-expand-sm {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-sm .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-sm .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-sm .navbar-nav .nav-link {
		padding-right: 1.25rem;
		padding-left: 1.25rem
	}
	.navbar-expand-sm>.container, .navbar-expand-sm>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-sm .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-sm .navbar-toggler {
		display: none
	}
}

@media ( max-width :767.98px) {
	.navbar-expand-md>.container, .navbar-expand-md>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :768px) {
	.navbar-expand-md {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-md .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-md .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-md .navbar-nav .nav-link {
		padding-right: 1.25rem;
		padding-left: 1.25rem
	}
	.navbar-expand-md>.container, .navbar-expand-md>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-md .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-md .navbar-toggler {
		display: none
	}
}

@media ( max-width :991.98px) {
	.navbar-expand-lg>.container, .navbar-expand-lg>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :992px) {
	.navbar-expand-lg {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-lg .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-lg .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-lg .navbar-nav .nav-link {
		padding-right: 1.25rem;
		padding-left: 1.25rem
	}
	.navbar-expand-lg>.container, .navbar-expand-lg>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-lg .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-lg .navbar-toggler {
		display: none
	}
}

@media ( max-width :1199.98px) {
	.navbar-expand-xl>.container, .navbar-expand-xl>.container-fluid {
		padding-right: 0;
		padding-left: 0
	}
}

@media ( min-width :1200px) {
	.navbar-expand-xl {
		-ms-flex-flow: row nowrap;
		flex-flow: row nowrap;
		-ms-flex-pack: start;
		justify-content: flex-start
	}
	.navbar-expand-xl .navbar-nav {
		-ms-flex-direction: row;
		flex-direction: row
	}
	.navbar-expand-xl .navbar-nav .dropdown-menu {
		position: absolute
	}
	.navbar-expand-xl .navbar-nav .nav-link {
		padding-right: 1.25rem;
		padding-left: 1.25rem
	}
	.navbar-expand-xl>.container, .navbar-expand-xl>.container-fluid {
		-ms-flex-wrap: nowrap;
		flex-wrap: nowrap
	}
	.navbar-expand-xl .navbar-collapse {
		display: -ms-flexbox !important;
		display: flex !important;
		-ms-flex-preferred-size: auto;
		flex-basis: auto
	}
	.navbar-expand-xl .navbar-toggler {
		display: none
	}
}

.navbar-expand {
	-ms-flex-flow: row nowrap;
	flex-flow: row nowrap;
	-ms-flex-pack: start;
	justify-content: flex-start
}

.navbar-expand>.container, .navbar-expand>.container-fluid {
	padding-right: 0;
	padding-left: 0
}

.navbar-expand .navbar-nav {
	-ms-flex-direction: row;
	flex-direction: row
}

.navbar-expand .navbar-nav .dropdown-menu {
	position: absolute
}

.navbar-expand .navbar-nav .nav-link {
	padding-right: 1.25rem;
	padding-left: 1.25rem
}

.navbar-expand>.container, .navbar-expand>.container-fluid {
	-ms-flex-wrap: nowrap;
	flex-wrap: nowrap
}

.navbar-expand .navbar-collapse {
	display: -ms-flexbox !important;
	display: flex !important;
	-ms-flex-preferred-size: auto;
	flex-basis: auto
}

.navbar-expand .navbar-toggler {
	display: none
}

.navbar-light .navbar-brand {
	color: #333
}

.navbar-light .navbar-brand:focus, .navbar-light .navbar-brand:hover {
	color: #333
}

.navbar-light .navbar-nav .nav-link {
	color: rgba(51, 51, 51, .75)
}

.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover
	{
	color: #333
}

.navbar-light .navbar-nav .nav-link.disabled {
	color: rgba(0, 0, 0, .5)
}

.navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active,
	.navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-link
	{
	color: #333
}

.navbar-light .navbar-toggler {
	color: rgba(51, 51, 51, .75);
	border-color: rgba(0, 0, 0, .1)
}

.navbar-light .navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(51, 51, 51, 0.75)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E")
}

.navbar-light .navbar-text {
	color: rgba(51, 51, 51, .75)
}

.navbar-light .navbar-text a {
	color: #333
}

.navbar-light .navbar-text a:focus, .navbar-light .navbar-text a:hover {
	color: #333
}

.navbar-dark .navbar-brand {
	color: #fff
}

.navbar-dark .navbar-brand:focus, .navbar-dark .navbar-brand:hover {
	color: #fff
}

.navbar-dark .navbar-nav .nav-link {
	color: rgba(255, 255, 255, .9)
}

.navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover
	{
	color: #fff
}

.navbar-dark .navbar-nav .nav-link.disabled {
	color: rgba(255, 255, 255, .5)
}

.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active,
	.navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link
	{
	color: #fff
}

.navbar-dark .navbar-toggler {
	color: rgba(255, 255, 255, .9);
	border-color: rgba(255, 255, 255, .1)
}

.navbar-dark .navbar-toggler-icon {
	background-image:
		url("data:image/svg+xml;charset=utf8,%3Csvg viewBox='0 0 30 30' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath stroke='rgba(255, 255, 255, 0.9)' stroke-width='2' stroke-linecap='round' stroke-miterlimit='10' d='M4 7h22M4 15h22M4 23h22'/%3E%3C/svg%3E")
}

.navbar-dark .navbar-text {
	color: rgba(255, 255, 255, .9)
}

.navbar-dark .navbar-text a {
	color: #fff
}

.navbar-dark .navbar-text a:focus, .navbar-dark .navbar-text a:hover {
	color: #fff
}

.navbar-nav-link {
	position: relative;
	display: block;
	cursor: pointer;
	padding: .875rem 1rem;
	outline: 0;
	transition: all ease-in-out .15s
}

.navbar-light+.table, .navbar-light+div[class*=table-responsive], .table+.card-body,
	div[class*=table-responsive]+.card-body {
	border-top: 1px solid #ddd
}

.table tbody:first-child tr:first-child td, .table tbody:first-child tr:first-child th,
	div[class*=table-responsive]>.table tbody:first-child tr:first-child td,
	div[class*=table-responsive]>.table tbody:first-child tr:first-child th
	{
	border-top: 0
}

.card-footer+.table, .card-footer+[class*=table-responsive] {
	border-top: 1px solid #ddd
}

legend {
	padding-top: .625rem;
	padding-bottom: .625rem;
	margin-bottom: 1.25rem;
	border-bottom: 1px solid #ddd;
	font-size: .8125rem
}

fieldset:first-child legend:first-child {
	padding-top: 0
}

select[multiple], select[size] {
	height: 200px;
	padding: 0
}

select[multiple] option, select[size] option {
	padding: .5rem 1.25rem;
	border-radius: .1875rem
}

select[multiple] option+option, select[size] option+option {
	margin-top: 1px
}

.form-control {
	background-clip: border-box;
	border-width: 1px 0;
	border-top-color: transparent !important
}

.form-control:disabled, .form-control[readonly] {
	border-bottom-style: dashed
}

.form-control:disabled {
	color: #999
}

.form-control[readonly] {
	box-shadow: none;
	border-bottom-color: #ddd !important
}

.form-control.border-success:focus {
	box-shadow: 0 1px 0 #4caf50
}

.form-control.border-danger:focus {
	box-shadow: 0 1px 0 #f44336
}

.form-control.border-warning:focus {
	box-shadow: 0 1px 0 #ff7043
}

.form-control.border-primary:focus {
	box-shadow: 0 1px 0 #6495ed
}

.form-control.border-info:focus {
	box-shadow: 0 1px 0 #00bcd4
}

.form-control.text-white {
	border-bottom-color: rgba(255, 255, 255, .5)
}

.form-control.text-white:focus {
	border-bottom-color: #fff;
	box-shadow: 0 1px 0 #fff
}

.form-control.text-white::-webkit-input-placeholder {
	color: #fff
}

.form-control.text-white::-moz-placeholder {
	color: #fff
}

.form-control.text-white:-ms-input-placeholder {
	color: #fff
}

.form-control.text-white::-ms-input-placeholder {
	color: #fff
}

.form-control.text-white::placeholder {
	color: #fff
}

.form-group .form-group:last-child {
	margin-bottom: 0
}

@media ( max-width :767.98px) {
	.form-group [class*=col-md-]:not([class*=col-form-label])+[class*=col-md-]
		{
		margin-top: 1.25rem
	}
}

@media ( max-width :991.98px) {
	.form-group [class*=col-lg-]:not([class*=col-form-label])+[class*=col-lg-]
		{
		margin-top: 1.25rem
	}
}

@media ( max-width :1199.98px) {
	.form-group [class*=col-xl-]:not([class*=col-form-label])+[class*=col-xl-]
		{
		margin-top: 1.25rem
	}
}

@media ( max-width :767.98px) {
	[class*=col-form-label][class*=col-md-] {
		padding-top: 0
	}
}

@media ( max-width :991.98px) {
	[class*=col-form-label][class*=col-lg-] {
		padding-top: 0
	}
}

@media ( max-width :1199.98px) {
	[class*=col-form-label][class*=col-xl-] {
		padding-top: 0
	}
}

.form-check:not(.form-check-inline) {
	margin-bottom: .5rem
}

.form-check:not(.form-check-inline):last-child {
	margin-bottom: 0
}

.form-group.row .form-check:not(.dropdown-item) {
	margin-top: .5625rem
}

.form-check.disabled {
	color: #999
}

.form-check.disabled .form-check-label {
	cursor: default
}

.form-check-input:disabled ~.form-check-label {
	cursor: default
}

.form-check-label {
	cursor: pointer
}

.form-check-inline .form-check-label {
	display: -ms-inline-flexbox;
	display: inline-flex;
	-ms-flex-align: start;
	align-items: flex-start
}

.form-check-inline .form-check-input {
	margin-top: .3rem
}

.form-check-inline:last-child {
	margin-right: 0
}

.form-check-inline input {
	position: static
}

.form-check-right {
	padding-left: 0;
	padding-right: 1.875rem
}

.form-check-right .form-check-input, .form-check-right input {
	left: auto;
	right: 0
}

.form-check-right.form-check-inline {
	padding: 0
}

.form-check-right.form-check-inline .form-check-input {
	margin-right: 0;
	margin-left: .625rem
}

.form-group-feedback {
	position: relative
}

.form-group-feedback-left .form-control-feedback {
	left: 0
}

.form-group-feedback-left .form-control {
	padding-left: 2rem
}

.form-group-feedback-left .form-control-lg {
	padding-left: 2.125rem
}

.form-group-feedback-left .form-control-sm {
	padding-left: 1.875rem
}

.form-group-feedback-right .form-control-feedback {
	right: 0
}

.form-group-feedback-right .form-control {
	padding-right: 2rem
}

.form-group-feedback-right .form-control-lg {
	padding-right: 2.125rem
}

.form-group-feedback-right .form-control-sm {
	padding-right: 1.875rem
}

.form-control-feedback {
	position: absolute;
	top: 0;
	color: #333;
	padding-left: 0;
	padding-right: 0;
	line-height: calc(1.5385em + 1rem + 2px);
	min-width: 1rem
}

.form-control-feedback-lg {
	padding-left: 0;
	padding-right: 0;
	line-height: calc(1.4286em + 1.25rem + 2px)
}

.form-control-feedback-sm {
	padding-left: 0;
	padding-right: 0;
	line-height: calc(1.6667em + .75rem + 2px)
}

input[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent)+.form-control-feedback
	{
	color: #fff
}

.btn {
	position: relative;
	text-transform: uppercase
}

.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn).active,
	.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn).focus,
	.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn):active,
	.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn):focus,
	.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn):hover,
	.show>.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn).dropdown-toggle
	{
	box-shadow: 0 0 0 62.5rem rgba(0, 0, 0, .075) inset
}

.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn).disabled,
	.btn:not(.bg-transparent):not([class*=btn-outline]):not(.btn-light):not(.btn-link):not([class*=alpha-]):not(.fab-menu-btn):disabled
	{
	box-shadow: none
}

.btn.disabled, .btn:disabled {
	cursor: default
}

.btn-light {
	color: #333;
	background-color: #f5f5f5;
	border-color: transparent
}

.btn-light.focus, .btn-light:focus, .btn-light:hover, .btn-light:not([disabled]):not(.disabled).active,
	.btn-light:not([disabled]):not(.disabled):active, .show>.btn-light.dropdown-toggle
	{
	color: #333;
	background-color: #eee;
	border-color: transparent
}

.btn-light.disabled, .btn-light:disabled {
	background-color: #f5f5f5;
	border-color: transparent
}

.btn-outline.disabled, .btn-outline:disabled, .btn-outline:not(:hover):not(:active):not(.active):not([aria-expanded=true])
	{
	background-color: transparent !important
}

.btn-outline:not(.disabled):not(:disabled):not([class*=alpha-]):hover,
	.btn-outline:not(.disabled):not(:disabled):not([class*=alpha-]):not([disabled]):not(.disabled).active,
	.btn-outline:not(.disabled):not(:disabled):not([class*=alpha-]):not([disabled]):not(.disabled):active,
	.show>.btn-outline:not(.disabled):not(:disabled):not([class*=alpha-]).dropdown-toggle
	{
	color: #fff !important
}

.btn-outline.bg-white:not(.disabled):not(:disabled):hover, .btn-outline.bg-white:not(.disabled):not(:disabled):not([disabled]):not(.disabled).active,
	.btn-outline.bg-white:not(.disabled):not(:disabled):not([disabled]):not(.disabled):active,
	.show>.btn-outline.bg-white:not(.disabled):not(:disabled).dropdown-toggle
	{
	color: #333 !important
}

.btn-link {
	font-weight: 500
}

.show>.btn-link.dropdown-toggle {
	color: #1f66e5
}

.btn-icon {
	padding-left: .62502rem;
	padding-right: .62502rem
}

.btn-icon input[type=checkbox], .btn-icon input[type=radio] {
	display: block
}

.btn-icon.btn-sm {
	padding-left: .50002rem;
	padding-right: .50002rem
}

.btn-icon.btn-lg {
	padding-left: .75002rem;
	padding-right: .75002rem
}

.btn-float {
	padding: 1rem;
	border-radius: .1875rem
}

.btn-float.btn-link {
	padding: .8rem
}

.btn-float i {
	display: block;
	top: 0
}

.btn-float>span {
	display: block;
	padding-top: .625rem;
	margin-bottom: -.40625rem;
	overflow: hidden;
	text-overflow: ellipsis
}

.btn.border-2 {
	padding-top: .4375rem;
	padding-bottom: .4375rem
}

.btn.border-2.btn-lg {
	padding-top: .5625rem;
	padding-bottom: .5625rem
}

.btn.border-2.btn-sm {
	padding-top: .3125rem;
	padding-bottom: .3125rem
}

.btn.border-2.btn-icon {
	padding-left: .56252rem;
	padding-right: .56252rem
}

.btn.border-2.btn-icon.btn-lg {
	padding-left: .68752rem;
	padding-right: .68752rem
}

.btn.border-2.btn-icon.btn-sm {
	padding-left: .43752rem;
	padding-right: .43752rem
}

.btn.border-2.btn-float {
	padding: .9375rem
}

.btn-labeled>b {
	position: absolute;
	top: -1px;
	background-color: rgba(0, 0, 0, .15);
	display: block;
	line-height: 1;
	padding: .68753rem
}

.btn-labeled>b>i {
	top: 0
}

.btn-labeled.rounded-round>b {
	border-radius: 100px
}

.btn-labeled.btn-lg>b {
	padding: .81253rem
}

.btn-labeled.btn-sm>b {
	padding: .56253rem
}

.btn-labeled-left {
	padding-left: 3.37506rem
}

.btn-labeled-left>b {
	left: -1px;
	border-top-left-radius: .1875rem;
	border-bottom-left-radius: .1875rem
}

.btn-labeled-left.btn-lg {
	padding-left: 3.75005rem
}

.btn-labeled-left.btn-lg>b {
	border-top-left-radius: .25rem;
	border-bottom-left-radius: .25rem
}

.btn-labeled-left.btn-sm {
	padding-left: 3.00006rem
}

.btn-labeled-left.btn-sm>b {
	border-top-left-radius: .125rem;
	border-bottom-left-radius: .125rem
}

.btn-labeled-right {
	padding-right: 3.37506rem
}

.btn-labeled-right>b {
	right: -1px;
	border-top-right-radius: .1875rem;
	border-bottom-right-radius: .1875rem
}

.dropdown-menu {
	background-clip: border-box
}

.dropdown-menu-right {
	left: auto;
	right: 0
}

.dropdown-item {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	position: relative;
	outline: 0;
	overflow: hidden;
	text-overflow: ellipsis;
	cursor: pointer;
	margin-bottom: 0;
	transition: background-color ease-in-out .15s, color ease-in-out .15s;
	font-size: small;
}

@media ( prefers-reduced-motion :reduce) {
	.dropdown-item {
		transition: none
	}
}

.dropdown-item+.dropdown-item, .dropdown-item+.dropdown-submenu,
	.dropdown-submenu+.dropdown-item {
	margin-top: 1px
}

.dropdown-item:active {
	color: #333;
	background-color: #f5f5f5
}

.dropdown-item.active {
	color: #fff;
	background-color: #26a69a
}

.dropdown-item.active .badge:not(.badge-mark) {
	background-color: #fff !important;
	color: #333 !important
}

.dropdown-item.active .badge-mark[class*=bg-] {
	background-color: #fff !important;
	border-color: #fff !important
}

.dropdown-item.active .badge-mark[class*=border-] {
	border-color: #fff !important
}

.dropdown-item.disabled, .dropdown-item:disabled {
	color: #999;
	background-color: transparent;
	cursor: default
}

.dropdown-item.disabled>.badge, .dropdown-item.disabled>img,
	.dropdown-item:disabled>.badge, .dropdown-item:disabled>img {
	opacity: .8
}

.dropdown-item-open {
	background-color: #f5f5f5;
	color: #333
}

.dropdown-header {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	margin-top: .25rem;
	margin-bottom: .25rem;
	line-height: 1.6667
}

.dropdown-header-highlight {
	margin-top: 0;
	background-color: #f8f8f8
}

.dropdown-header-highlight+.dropdown-item, .dropdown-item+.dropdown-header-highlight
	{
	margin-top: .5rem
}

.dropdown-header-highlight:first-child {
	margin-top: 0
}

.dropdown-header>i, .dropdown-header>img, .dropdown-item>i,
	.dropdown-item>img {
	margin-right: 1.25rem
}

.dropdown-header>i, .dropdown-item>i {
	top: 0
}

.dropdown-header>img, .dropdown-item>img {
	max-height: 1.25003rem
}

.dropdown-item.form-check {
	padding: 0;
	margin-bottom: 0
}

.dropdown-item.form-check .form-check-label {
	-ms-flex: 1;
	flex: 1;
	padding: .5rem 1.25rem
}

.dropdown-item.form-check.form-check-right .form-check-label {
	padding-left: 1.25rem
}

.dropdown-scrollable {
	max-height: 340px;
	overflow-y: auto
}

.dropdown-menu>.dropdown-submenu {
	position: relative
}

.dropdown-menu>.dropdown-submenu>.dropdown-item {
	padding-right: 2.75rem
}

.dropdown-menu>.dropdown-submenu>.dropdown-item:after {
	content: "";
	font-family: icomoon;
	position: absolute;
	top: 50%;
	margin-top: -.5rem;
	right: 1.25rem;
	font-size: 1rem;
	line-height: 1;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale
}

.dropdown-menu>.dropdown-submenu.show>.dropdown-item, .dropdown-menu>.dropdown-submenu:hover>.dropdown-item
	{
	background-color: #f5f5f5;
	color: #333
}

.dropdown-menu>.dropdown-submenu:focus>.dropdown-item:not(.dropdown-toggle)
	 ~.dropdown-menu, .dropdown-menu>.dropdown-submenu:hover>.dropdown-item:not(.dropdown-toggle)
	 ~.dropdown-menu {
	display: block
}

.dropdown-menu>.dropdown-submenu.disabled>.dropdown-menu {
	display: none
}

.dropdown-menu>.dropdown-submenu.disabled>.dropdown-item {
	background-color: transparent;
	color: #999;
	cursor: default
}

.dropdown-menu>.dropdown-submenu>.dropdown-menu {
	top: 0;
	left: 100%;
	margin-top: -.5rem
}

.dropdown-menu>.dropdown-submenu.dropdown-submenu-left>.dropdown-menu {
	left: auto;
	right: 100%
}

@media ( max-width :991.98px) {
	.dropdown-menu>.dropdown-submenu .dropdown-toggle:after {
		content: ""
	}
	.dropdown-menu>.dropdown-submenu .dropdown-menu, .dropdown-menu>.dropdown-submenu.dropdown-submenu-left .dropdown-menu
		{
		position: static;
		margin: 0 !important;
		border-width: 0;
		box-shadow: none;
		border-radius: 0
	}
	.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-item,
		.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 2.5rem
	}
	.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-item,
		.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 3.75rem
	}
}

.dropdown-menu .dropup>.dropdown-menu {
	top: auto;
	bottom: 0;
	margin-top: 0;
	margin-bottom: -.5rem
}

.dropdown-menu .dropdown-submenu+.dropdown-submenu {
	margin-top: 1px
}

.dropright .dropdown-toggle::after {
	vertical-align: middle
}

.dropleft .dropdown-toggle::before {
	vertical-align: middle
}

.dropleft .dropdown-submenu .dropdown-toggle::before {
	content: none
}

.dropdown-menu-lg .dropdown-item {
	padding-top: .625rem;
	padding-bottom: .625rem;
	font-size: .875rem;
	line-height: 1.4286
}

.dropdown-menu-sm .dropdown-item {
	padding-top: .375rem;
	padding-bottom: .375rem;
	font-size: .75rem;
	line-height: 1.6667
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-item,
	.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu>.dropdown-item
	{
	color: #fff
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-item:focus,
	.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-item:hover,
	.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu>.dropdown-item:focus,
	.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu>.dropdown-item:hover
	{
	background-color: rgba(0, 0, 0, .1)
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-item.active,
	.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu>.dropdown-item.active
	{
	background-color: rgba(0, 0, 0, .2)
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-item.disabled,
	.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu>.dropdown-item.disabled
	{
	background-color: transparent;
	color: rgba(255, 255, 255, .6)
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu.show>.dropdown-item,
	.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu:hover>.dropdown-item
	{
	background-color: rgba(0, 0, 0, .1);
	color: #fff
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-submenu.disabled>.dropdown-item
	{
	background-color: transparent;
	color: rgba(255, 255, 255, .6)
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-header
	{
	color: rgba(255, 255, 255, .6)
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-header-highlight
	{
	background-color: rgba(0, 0, 0, .1)
}

.dropdown-menu[class*=bg-]:not(.bg-white):not(.bg-light)>.dropdown-divider
	{
	border-top-color: rgba(255, 255, 255, .4)
}

.btn-group>.btn.border-2:not(:first-child) {
	margin-left: -2px
}

.btn-group>.btn.border-3:not(:first-child) {
	margin-left: -3px
}

.btn-group-justified {
	display: -ms-flexbox;
	display: flex
}

.btn-group-justified .btn, .btn-group-justified .btn-group {
	-ms-flex: 1;
	flex: 1
}

.input-group .form-group-feedback {
	position: relative;
	-ms-flex: 1 1 auto;
	flex: 1 1 auto;
	width: 1%;
	z-index: 4
}

.input-group .form-group-feedback:not(:last-child) .form-control {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0
}

.input-group .form-group-feedback:not(:first-child) .form-control {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0
}

.form-control-feedback+.input-group, .input-group+.form-control-feedback
	{
	z-index: 4
}

.input-group-text i {
	display: block;
	top: 0
}

.input-group-prepend {
	margin-right: 1.25rem
}

.input-group>.input-group-prepend>.btn:last-of-type {
	border-top-right-radius: .1875rem;
	border-bottom-right-radius: .1875rem
}

.input-group-append {
	margin-left: 1.25rem
}

.input-group>.input-group-append>.btn:first-of-type {
	border-top-left-radius: .1875rem;
	border-bottom-left-radius: .1875rem
}

.input-group-lg>.input-group-append>.btn, .input-group-lg>.input-group-prepend>.btn
	{
	padding-left: 1.125rem;
	padding-right: 1.125rem
}

.input-group-lg>.input-group-append>.btn:first-of-type, .input-group-lg>.input-group-prepend>.btn:first-of-type
	{
	border-top-left-radius: .25rem;
	border-bottom-left-radius: .25rem
}

.input-group-lg>.input-group-append>.btn:last-of-type, .input-group-lg>.input-group-prepend>.btn:last-of-type
	{
	border-top-right-radius: .25rem;
	border-bottom-right-radius: .25rem
}

.input-group-lg>.input-group-append>.btn-icon, .input-group-lg>.input-group-prepend>.btn-icon
	{
	padding-left: .75002rem;
	padding-right: .75002rem
}

.input-group-sm>.input-group-append>.btn, .input-group-sm>.input-group-prepend>.btn
	{
	padding-left: .875rem;
	padding-right: .875rem
}

.input-group-sm>.input-group-append>.btn:first-of-type, .input-group-sm>.input-group-prepend>.btn:first-of-type
	{
	border-top-left-radius: .125rem;
	border-bottom-left-radius: .125rem
}

.input-group-sm>.input-group-append>.btn:last-of-type, .input-group-sm>.input-group-prepend>.btn:last-of-type
	{
	border-top-right-radius: .125rem;
	border-bottom-right-radius: .125rem
}

.input-group-sm>.input-group-append>.btn-icon, .input-group-sm>.input-group-prepend>.btn-icon
	{
	padding-left: .50002rem;
	padding-right: .50002rem
}

.custom-control {
	margin-bottom: .5rem
}

.custom-control:last-child {
	margin-bottom: 0
}

.custom-control-inline {
	margin-bottom: 0
}

.custom-control-inline:last-child {
	margin-right: 0
}

.custom-control-input:active ~.custom-control-label::before {
	transition: all ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.custom-control-input:active ~.custom-control-label::before {
		transition: none
	}
}

.custom-control-input:disabled ~.custom-control-label {
	cursor: default
}

.custom-control-label {
	cursor: pointer
}

.custom-control-label::before {
	top: .00002rem
}

.custom-control-label::after {
	top: .00002rem
}

.custom-control-right {
	padding-left: 0;
	padding-right: 1.875rem
}

.custom-control-right .custom-control-input {
	right: 0
}

.custom-control-right .custom-control-label:after, .custom-control-right .custom-control-label:before
	{
	left: auto;
	right: 0
}

.custom-select {
	cursor: pointer;
	border-width: 1px 0;
	border-top-color: transparent;
	transition: all ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.custom-select {
		transition: none
	}
}

.custom-select:focus {
	box-shadow: 0 1px 0 #009688
}

.custom-select:disabled {
	cursor: default;
	border-bottom-style: dashed
}

.custom-select:disabled:focus, .custom-select:disabled:hover {
	box-shadow: none
}

.custom-file-label {
	border-width: 1px 0;
	border-top-color: transparent;
	margin-bottom: 0
}

.custom-file-label:after {
	border-left: 0;
	font-weight: 500;
	text-transform: uppercase
}

.nav-link {
	position: relative;
	transition: all ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.nav-link {
		transition: none
	}
}

.nav-link.disabled {
	cursor: default
}

.nav-tabs {
	margin-bottom: 1.25rem
}

.nav-tabs .nav-link {
	border-top-left-radius: 0;
	border-top-right-radius: 0;
	color: #777
}

.nav-tabs .nav-link:focus, .nav-tabs .nav-link:hover {
	color: #333
}

.nav-tabs .nav-link.disabled {
	color: #999
}

.nav-tabs .nav-item.show .nav-link:not(.active) {
	border-color: transparent;
	background-color: transparent
}

.nav-tabs.border-top-1 {
	border-top-color: #ddd
}

.nav-tabs-responsive {
	overflow-x: auto;
	box-shadow: 0 -1px 0 #ddd inset
}

.nav-tabs-bottom .nav-link, .nav-tabs-highlight .nav-link, .nav-tabs-top .nav-link
	{
	position: relative
}

.nav-tabs-bottom .nav-link:before, .nav-tabs-highlight .nav-link:before,
	.nav-tabs-top .nav-link:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	right: 0;
	transition: background-color ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.nav-tabs-bottom .nav-link:before, .nav-tabs-highlight .nav-link:before,
		.nav-tabs-top .nav-link:before {
		transition: none
	}
}

.nav-tabs-highlight .nav-link {
	border-top-left-radius: 0;
	border-top-right-radius: 0
}

.nav-tabs-highlight .nav-link:before {
	height: 2px;
	top: -1px;
	left: -1px;
	right: -1px
}

.nav-tabs-highlight .nav-link.active {
	border-top-color: #6495ed
}

.nav-tabs-highlight .nav-link.active:before {
	background-color: #6495ed
}

.nav-tabs-top .nav-item {
	margin-bottom: 0
}

.nav-tabs-top .nav-link {
	border-width: 0;
	border-top-left-radius: 0;
	border-top-right-radius: 0
}

.nav-tabs-top .nav-link:focus:before, .nav-tabs-top .nav-link:hover:before
	{
	background-color: #ddd
}

.nav-tabs-top .nav-link:before {
	height: 2px
}

.nav-tabs-top .nav-link.disabled:before {
	content: none
}

.nav-tabs-top .nav-item.show .nav-link:not(.active):before {
	background-color: #ddd
}

.nav-tabs-top .nav-link.active:before {
	background-color: #ec407a
}

.nav-tabs-top .nav-item.show .nav-link, .nav-tabs-top .nav-link.active {
	background-color: transparent
}

.nav-tabs-top .dropdown-menu {
	margin-top: 0
}

.nav-tabs-top.border-top-1 .nav-item {
	margin-top: -1px
}

.nav-tabs-bottom .nav-item {
	margin-bottom: 0
}

.nav-tabs-bottom .nav-link {
	border-width: 0;
	margin-bottom: -1px
}

.nav-tabs-bottom .nav-link:before {
	height: 2px;
	top: auto;
	bottom: 0
}

.nav-tabs-bottom .nav-link.active:before {
	background-color: #ec407a
}

.nav-tabs-bottom .nav-item.show .nav-link, .nav-tabs-bottom .nav-link.active
	{
	background-color: transparent
}

.nav-tabs-bottom .dropdown-menu {
	margin-top: 0
}

.nav-tabs-solid {
	background-color: #fafafa;
	border: 1px solid #ddd;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24)
}

.nav-tabs-solid .nav-item {
	margin-bottom: 0
}

.nav-tabs-solid .nav-link {
	border-width: 0
}

.nav-tabs-solid .nav-item.show .nav-link {
	background-color: transparent
}

.nav-tabs-solid .nav-item.show .nav-link.active, .nav-tabs-solid .nav-link.active
	{
	color: #fff;
	background-color: #26a69a
}

.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .nav-link
	{
	color: rgba(255, 255, 255, .9)
}

.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .nav-link:focus,
	.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .nav-link:hover
	{
	color: #fff
}

.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .nav-link.disabled
	{
	color: rgba(255, 255, 255, .6)
}

.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .nav-item.show .nav-link
	{
	color: #fff
}

.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .nav-item.show .nav-link.active,
	.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .nav-link.active
	{
	color: #fff;
	background-color: rgba(0, 0, 0, .1)
}

.nav-tabs-solid[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent)+.tab-content[class*=bg-]
	{
	border-top-color: rgba(255, 255, 255, .5)
}

.nav-tabs-vertical .nav-link {
	-ms-flex-pack: start;
	justify-content: flex-start;
	border-left-width: 0
}

.nav-tabs-vertical .nav-link, .nav-tabs-vertical .nav-link.disabled,
	.nav-tabs-vertical .nav-link:focus, .nav-tabs-vertical .nav-link:hover
	{
	border-color: transparent #ddd transparent transparent
}

.nav-tabs-vertical .nav-link:before {
	content: '';
	position: absolute;
	top: -1px;
	bottom: -1px;
	left: 0;
	width: 2px;
	transition: background-color ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.nav-tabs-vertical .nav-link:before {
		transition: none
	}
}

.nav-tabs-vertical .nav-item.show .nav-link:not(.active) {
	border-right-color: #ddd;
	border-bottom-color: transparent
}

.nav-tabs-vertical-right .nav-link, .nav-tabs-vertical-right .nav-link.disabled,
	.nav-tabs-vertical-right .nav-link:focus, .nav-tabs-vertical-right .nav-link:hover
	{
	border-color: transparent transparent transparent #ddd
}

.nav-tabs-vertical-right .nav-link:before {
	left: auto;
	right: 0
}

.nav-tabs-vertical-right .nav-item.show .nav-link:not(.active) {
	border-right-color: transparent;
	border-left-color: #ddd
}

.nav-tabs-vertical .nav-link.active:before {
	background-color: #6495ed
}

.nav-tabs-vertical .nav-item.show .nav-link, .nav-tabs-vertical .nav-link.active
	{
	background-color: transparent;
	border-color: #ddd transparent
}

.nav-pills {
	margin-bottom: 1.25rem
}

.nav-pills .nav-link {
	color: #777
}

.nav-pills .nav-link:not(.active):focus, .nav-pills .nav-link:not(.active):hover
	{
	color: #333
}

.nav-pills .nav-link.active .badge:not(.bg-transparent):not(.bg-light):not(.bg-white)
	{
	background-color: #fff;
	color: #333;
	transition: all ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.nav-pills .nav-link.active .badge:not(.bg-transparent):not(.bg-light):not(.bg-white)
		{
		transition: none
	}
}

.nav-pills .nav-link.disabled, .nav-pills .nav-link.disabled:focus,
	.nav-pills .nav-link.disabled:hover {
	color: #999
}

.nav-pills .nav-item.show .nav-link:not(.active) {
	color: #333;
	background-color: transparent
}

.nav-pills.flex-column .nav-link {
	-ms-flex-pack: start;
	justify-content: flex-start
}

.nav-pills-bordered .nav-item+.nav-item {
	margin-left: .625rem
}

.nav-pills-bordered .nav-link {
	border: 1px solid #ddd
}

.nav-pills-bordered .nav-item.show .nav-link:not(.active),
	.nav-pills-bordered .nav-link:not(.active):focus, .nav-pills-bordered .nav-link:not(.active):hover
	{
	background-color: #f5f5f5
}

.nav-pills-bordered .nav-link.active {
	border-color: #26a69a
}

.nav-pills-bordered .nav-link.disabled, .nav-pills-bordered .nav-link.disabled:focus,
	.nav-pills-bordered .nav-link.disabled:hover {
	background-color: #fafafa
}

.nav-pills-bordered.flex-column .nav-item+.nav-item {
	margin-left: 0;
	margin-top: .625rem
}

.nav-pills-toolbar .nav-item+.nav-item {
	margin-left: -1px
}

.nav-pills-toolbar .nav-link {
	border-radius: 0
}

.nav-pills-toolbar .nav-link.active {
	z-index: 3
}

.nav-pills-toolbar .nav-item:first-child .nav-link {
	border-top-left-radius: .1875rem;
	border-bottom-left-radius: .1875rem
}

.nav-pills-toolbar .nav-item:last-child .nav-link {
	border-top-right-radius: .1875rem;
	border-bottom-right-radius: .1875rem
}

.nav-pills-toolbar.flex-column .nav-item:first-child .nav-link {
	border-top-left-radius: 0;
	border-bottom-left-radius: 0;
	border-top-left-radius: .1875rem;
	border-top-right-radius: .1875rem
}

.nav-pills-toolbar.flex-column .nav-item:last-child .nav-link {
	border-top-right-radius: 0;
	border-bottom-right-radius: 0;
	border-bottom-right-radius: .1875rem;
	border-bottom-left-radius: .1875rem
}

.nav-pills-toolbar.flex-column .nav-item+.nav-item {
	margin-left: 0;
	margin-top: -1px
}

.navbar {
	-ms-flex-align: stretch;
	align-items: stretch;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24)
}

.navbar-component {
	border: 1px solid transparent;
	margin-bottom: 1.25rem
}

.page-header .navbar-component {
	margin-left: 1.25rem;
	margin-right: 1.25rem
}

.navbar-brand img {
	height: 1rem;
	display: block
}

.navbar-text {
	padding-top: .875rem;
	padding-bottom: .875rem
}

.navbar-nav .nav-link {
	padding-left: 1.25rem;
	padding-right: 1.25rem
}

.navbar-nav-link {
	position: relative;
	display: block;
	cursor: pointer;
	padding: .875rem 1rem;
	outline: 0;
	transition: all ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.navbar-nav-link {
		transition: none
	}
}

.navbar-nav-link.disabled {
	cursor: default
}

.navbar-nav-link.disabled .badge, .navbar-nav-link.disabled img {
	opacity: .5
}

.navbar-nav-link .badge {
	position: absolute;
	top: 0;
	right: 0
}

.navbar-nav-link .badge-mark {
	top: .4375rem;
	right: .5rem
}

.navbar-nav-highlight .navbar-nav-link {
	text-transform: uppercase;
	font-size: .75rem;
	line-height: 1.6667;
	font-weight: 500
}

.navbar-nav-highlight .navbar-nav-link:before {
	content: '';
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	background-color: transparent;
	width: 2px
}

.navbar-light .navbar-nav-highlight .navbar-nav-link.active:before {
	background-color: #ec407a
}

.navbar-dark .navbar-nav-highlight .navbar-nav-link.active:before {
	background-color: #fff
}

.navbar-collapse {
	margin-left: -1.25rem;
	margin-right: -1.25rem;
	padding-left: 1.25rem;
	padding-right: 1.25rem
}

.navbar-toggler {
	border: 0;
	line-height: 1.5385;
	cursor: pointer;
	transition: all ease-in-out .15s
}

@media ( prefers-reduced-motion :reduce) {
	.navbar-toggler {
		transition: none
	}
}

.navbar-toggler+.navbar-toggler {
	margin-left: 1.25rem
}

.navbar-toggler:focus, .navbar-toggler:hover {
	outline: 0
}

.navbar-dark .navbar-toggler:focus, .navbar-dark .navbar-toggler:hover {
	color: #fff
}

.navbar-light .navbar-toggler {
	color: rgba(51, 51, 51, .75)
}

.navbar-light .navbar-toggler:focus, .navbar-light .navbar-toggler:hover,
	.navbar-light .navbar-toggler[aria-expanded=true] {
	color: #333
}

@media ( max-width :575.98px) {
	.navbar-expand-sm .navbar-nav:first-child>.nav-item:first-child {
		margin-top: .625rem
	}
	.navbar-expand-sm .navbar-nav:last-child>.nav-item:not(.show):last-child
		{
		margin-bottom: .625rem
	}
	.navbar-expand-sm .navbar-nav-link {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		margin-left: -1.25rem;
		margin-right: -1.25rem;
		padding-left: 1.25rem;
		padding-right: 1.25rem
	}
	.navbar-expand-sm .navbar-nav-link .badge:not(.position-static) {
		position: static
	}
	.navbar-expand-sm .navbar-nav-link.dropdown-toggle:not(.caret-0) {
		padding-right: 2.5rem
	}
	.navbar-expand-sm .navbar-nav-link.dropdown-toggle:not(.caret-0):after {
		position: absolute;
		top: 50%;
		right: 1.25rem;
		margin: 0;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%)
	}
	.navbar-expand-sm.navbar-dark .navbar-collapse {
		border-top: 1px solid rgba(255, 255, 255, .1)
	}
	.navbar-expand-sm.navbar-light .navbar-collapse {
		border-top: 1px solid #ddd
	}
	.navbar-expand-sm .navbar-nav>.nav-item>.dropdown-menu {
		margin-top: 1.25rem;
		margin-bottom: 1.25rem
	}
	.navbar-expand-sm .dropdown-submenu .dropdown-toggle:after {
		content: ""
	}
	.navbar-expand-sm .dropdown-submenu .dropdown-menu, .navbar-expand-sm .dropdown-submenu.dropdown-submenu-left .dropdown-menu
		{
		margin: 0;
		border-width: 0;
		box-shadow: none;
		border-radius: 0
	}
	.navbar-expand-sm .dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-sm .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 2.5rem
	}
	.navbar-expand-sm .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-sm .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 3.75rem
	}
	.navbar-expand-sm.fixed-bottom .navbar-collapse, .navbar-expand-sm.fixed-top .navbar-collapse
		{
		max-height: 440px;
		overflow-y: auto
	}
}

@media ( min-width :576px) {
	.navbar-expand-sm .navbar-brand {
		min-width: 15.625rem
	}
	.navbar-expand-sm .navbar-nav-link:before {
		top: auto;
		right: 0;
		width: auto;
		height: 2px
	}
}

@media ( max-width :767.98px) {
	.navbar-expand-md .navbar-nav:first-child>.nav-item:first-child {
		margin-top: .625rem
	}
	.navbar-expand-md .navbar-nav:last-child>.nav-item:not(.show):last-child
		{
		margin-bottom: .625rem
	}
	.navbar-expand-md .navbar-nav-link {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		margin-left: -1.25rem;
		margin-right: -1.25rem;
		padding-left: 1.25rem;
		padding-right: 1.25rem
	}
	.navbar-expand-md .navbar-nav-link .badge:not(.position-static) {
		position: static
	}
	.navbar-expand-md .navbar-nav-link.dropdown-toggle:not(.caret-0) {
		padding-right: 2.5rem
	}
	.navbar-expand-md .navbar-nav-link.dropdown-toggle:not(.caret-0):after {
		position: absolute;
		top: 50%;
		right: 1.25rem;
		margin: 0;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%)
	}
	.navbar-expand-md.navbar-dark .navbar-collapse {
		border-top: 1px solid rgba(255, 255, 255, .1)
	}
	.navbar-expand-md.navbar-light .navbar-collapse {
		border-top: 1px solid #ddd
	}
	.navbar-expand-md .navbar-nav>.nav-item>.dropdown-menu {
		margin-top: 1.25rem;
		margin-bottom: 1.25rem
	}
	.navbar-expand-md .dropdown-submenu .dropdown-toggle:after {
		content: ""
	}
	.navbar-expand-md .dropdown-submenu .dropdown-menu, .navbar-expand-md .dropdown-submenu.dropdown-submenu-left .dropdown-menu
		{
		margin: 0;
		border-width: 0;
		box-shadow: none;
		border-radius: 0
	}
	.navbar-expand-md .dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-md .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 2.5rem
	}
	.navbar-expand-md .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-md .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 3.75rem
	}
	.navbar-expand-md.fixed-bottom .navbar-collapse, .navbar-expand-md.fixed-top .navbar-collapse
		{
		max-height: 440px;
		overflow-y: auto
	}
}

@media ( min-width :768px) {
	.navbar-expand-md .navbar-brand {
		min-width: 15.625rem
	}
	.navbar-expand-md .navbar-nav-link:before {
		top: auto;
		right: 0;
		width: auto;
		height: 2px
	}
}

@media ( max-width :991.98px) {
	.navbar-expand-lg .navbar-nav:first-child>.nav-item:first-child {
		margin-top: .625rem
	}
	.navbar-expand-lg .navbar-nav:last-child>.nav-item:not(.show):last-child
		{
		margin-bottom: .625rem
	}
	.navbar-expand-lg .navbar-nav-link {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		margin-left: -1.25rem;
		margin-right: -1.25rem;
		padding-left: 1.25rem;
		padding-right: 1.25rem
	}
	.navbar-expand-lg .navbar-nav-link .badge:not(.position-static) {
		position: static
	}
	.navbar-expand-lg .navbar-nav-link.dropdown-toggle:not(.caret-0) {
		padding-right: 2.5rem
	}
	.navbar-expand-lg .navbar-nav-link.dropdown-toggle:not(.caret-0):after {
		position: absolute;
		top: 50%;
		right: 1.25rem;
		margin: 0;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%)
	}
	.navbar-expand-lg.navbar-dark .navbar-collapse {
		border-top: 1px solid rgba(255, 255, 255, .1)
	}
	.navbar-expand-lg.navbar-light .navbar-collapse {
		border-top: 1px solid #ddd
	}
	.navbar-expand-lg .navbar-nav>.nav-item>.dropdown-menu {
		margin-top: 1.25rem;
		margin-bottom: 1.25rem
	}
	.navbar-expand-lg .dropdown-submenu .dropdown-toggle:after {
		content: ""
	}
	.navbar-expand-lg .dropdown-submenu .dropdown-menu, .navbar-expand-lg .dropdown-submenu.dropdown-submenu-left .dropdown-menu
		{
		margin: 0;
		border-width: 0;
		box-shadow: none;
		border-radius: 0
	}
	.navbar-expand-lg .dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-lg .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 2.5rem
	}
	.navbar-expand-lg .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-lg .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 3.75rem
	}
	.navbar-expand-lg.fixed-bottom .navbar-collapse, .navbar-expand-lg.fixed-top .navbar-collapse
		{
		max-height: 440px;
		overflow-y: auto
	}
}

@media ( min-width :992px) {
	.navbar-expand-lg .navbar-brand {
		min-width: 15.625rem
	}
	.navbar-expand-lg .navbar-nav-link:before {
		top: auto;
		right: 0;
		width: auto;
		height: 2px
	}
}

@media ( max-width :1199.98px) {
	.navbar-expand-xl .navbar-nav:first-child>.nav-item:first-child {
		margin-top: .625rem
	}
	.navbar-expand-xl .navbar-nav:last-child>.nav-item:not(.show):last-child
		{
		margin-bottom: .625rem
	}
	.navbar-expand-xl .navbar-nav-link {
		display: -ms-flexbox;
		display: flex;
		-ms-flex-align: center;
		align-items: center;
		margin-left: -1.25rem;
		margin-right: -1.25rem;
		padding-left: 1.25rem;
		padding-right: 1.25rem
	}
	.navbar-expand-xl .navbar-nav-link .badge:not(.position-static) {
		position: static
	}
	.navbar-expand-xl .navbar-nav-link.dropdown-toggle:not(.caret-0) {
		padding-right: 2.5rem
	}
	.navbar-expand-xl .navbar-nav-link.dropdown-toggle:not(.caret-0):after {
		position: absolute;
		top: 50%;
		right: 1.25rem;
		margin: 0;
		-webkit-transform: translateY(-50%);
		transform: translateY(-50%)
	}
	.navbar-expand-xl.navbar-dark .navbar-collapse {
		border-top: 1px solid rgba(255, 255, 255, .1)
	}
	.navbar-expand-xl.navbar-light .navbar-collapse {
		border-top: 1px solid #ddd
	}
	.navbar-expand-xl .navbar-nav>.nav-item>.dropdown-menu {
		margin-top: 1.25rem;
		margin-bottom: 1.25rem
	}
	.navbar-expand-xl .dropdown-submenu .dropdown-toggle:after {
		content: ""
	}
	.navbar-expand-xl .dropdown-submenu .dropdown-menu, .navbar-expand-xl .dropdown-submenu.dropdown-submenu-left .dropdown-menu
		{
		margin: 0;
		border-width: 0;
		box-shadow: none;
		border-radius: 0
	}
	.navbar-expand-xl .dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-xl .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 2.5rem
	}
	.navbar-expand-xl .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-item,
		.navbar-expand-xl .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
		{
		padding-left: 3.75rem
	}
	.navbar-expand-xl.fixed-bottom .navbar-collapse, .navbar-expand-xl.fixed-top .navbar-collapse
		{
		max-height: 440px;
		overflow-y: auto
	}
}

@media ( min-width :1200px) {
	.navbar-expand-xl .navbar-brand {
		min-width: 15.625rem
	}
	.navbar-expand-xl .navbar-nav-link:before {
		top: auto;
		right: 0;
		width: auto;
		height: 2px
	}
}

.navbar-expand .navbar-nav:first-child>.nav-item:first-child {
	margin-top: .625rem
}

.navbar-expand .navbar-nav:last-child>.nav-item:not(.show):last-child {
	margin-bottom: .625rem
}

.navbar-expand .navbar-nav-link {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	margin-left: -1.25rem;
	margin-right: -1.25rem;
	padding-left: 1.25rem;
	padding-right: 1.25rem
}

.navbar-expand .navbar-nav-link .badge:not(.position-static) {
	position: static
}

.navbar-expand .navbar-nav-link.dropdown-toggle:not(.caret-0) {
	padding-right: 2.5rem
}

.navbar-expand .navbar-nav-link.dropdown-toggle:not(.caret-0):after {
	position: absolute;
	top: 50%;
	right: 1.25rem;
	margin: 0;
	-webkit-transform: translateY(-50%);
	transform: translateY(-50%)
}

.navbar-expand.navbar-dark .navbar-collapse {
	border-top: 1px solid rgba(255, 255, 255, .1)
}

.navbar-expand.navbar-light .navbar-collapse {
	border-top: 1px solid #ddd
}

.navbar-expand .navbar-nav>.nav-item>.dropdown-menu {
	margin-top: 1.25rem;
	margin-bottom: 1.25rem
}

.navbar-expand .dropdown-submenu .dropdown-toggle:after {
	content: ""
}

.navbar-expand .dropdown-submenu .dropdown-menu, .navbar-expand .dropdown-submenu.dropdown-submenu-left .dropdown-menu
	{
	margin: 0;
	border-width: 0;
	box-shadow: none;
	border-radius: 0
}

.navbar-expand .dropdown-submenu>.dropdown-menu>.dropdown-item,
	.navbar-expand .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
	{
	padding-left: 2.5rem
}

.navbar-expand .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-item,
	.navbar-expand .dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-menu>.dropdown-submenu>.dropdown-item
	{
	padding-left: 3.75rem
}

.navbar-expand.fixed-bottom .navbar-collapse, .navbar-expand.fixed-top .navbar-collapse
	{
	max-height: 440px;
	overflow-y: auto
}

.navbar-expand .navbar-brand {
	min-width: 15.625rem
}

.navbar-expand .navbar-nav-link:before {
	top: auto;
	right: 0;
	width: auto;
	height: 2px
}

.navbar-light {
	color: rgba(51, 51, 51, .75);
	background-color: #fff
}

.content+.navbar-light, .fixed-bottom>.navbar-light:first-child,
	.page-content+.navbar-light, .page-header-content+.navbar-light {
	border-top: 1px solid transparent
}

.navbar-light .navbar-nav .nav-link {
	color: #333
}

.navbar-light .navbar-nav .nav-link:focus, .navbar-light .navbar-nav .nav-link:hover
	{
	color: #333
}

.navbar-light .navbar-nav .nav-link.disabled {
	color: #999
}

.navbar-light .navbar-nav .active>.nav-link, .navbar-light .navbar-nav .nav-link.active,
	.navbar-light .navbar-nav .nav-link.show, .navbar-light .navbar-nav .show>.nav-link
	{
	color: #333
}

.navbar-light .navbar-nav-link {
	color: rgba(51, 51, 51, .75)
}

.navbar-light .navbar-nav-link:focus, .navbar-light .navbar-nav-link:hover
	{
	color: #333;
	background-color: transparent
}

.navbar-light .navbar-nav-link.disabled {
	color: rgba(0, 0, 0, .5);
	background-color: transparent
}

.navbar-light .active>.navbar-nav-link, .navbar-light .navbar-nav-link.active,
	.navbar-light .navbar-nav-link.show, .navbar-light .show>.navbar-nav-link
	{
	color: #333;
	background-color: transparent
}

.navbar-light .navbar-text a {
	color: #6495ed
}

.navbar-light .navbar-text a:focus, .navbar-light .navbar-text a:hover {
	color: #1f66e5
}

.navbar-dark {
	color: rgba(255, 255, 255, .9);
	background-color: #293a50
}

.navbar-dark .navbar-nav .nav-link {
	color: #333
}

.navbar-dark .navbar-nav .nav-link:focus, .navbar-dark .navbar-nav .nav-link:hover
	{
	color: #333
}

.navbar-dark .navbar-nav .nav-link.disabled {
	color: #999
}

.navbar-dark .navbar-nav .active>.nav-link, .navbar-dark .navbar-nav .nav-link.active,
	.navbar-dark .navbar-nav .nav-link.show, .navbar-dark .navbar-nav .show>.nav-link
	{
	color: #333
}

.navbar-dark .navbar-nav-link {
	color: rgba(255, 255, 255, .9)
}

.navbar-dark .navbar-nav-link:focus, .navbar-dark .navbar-nav-link:hover
	{
	color: #fff;
	background-color: transparent
}

.navbar-dark .navbar-nav-link.disabled {
	color: rgba(255, 255, 255, .5);
	background-color: transparent
}

.navbar-dark .active>.navbar-nav-link, .navbar-dark .navbar-nav-link.active,
	.navbar-dark .navbar-nav-link.show, .navbar-dark .show>.navbar-nav-link
	{
	color: #fff;
	background-color: transparent
}

.navbar-nav .nav-tabs .nav-link {
	color: #777
}

.navbar-nav .nav-tabs .nav-link:focus, .navbar-nav .nav-tabs .nav-link:hover
	{
	color: #333
}

.navbar-nav .nav-tabs .nav-link.disabled {
	color: #999
}

.navbar-nav .nav-tabs .active>.nav-link, .navbar-nav .nav-tabs .nav-link.active,
	.navbar-nav .nav-tabs .nav-link.show, .navbar-nav .nav-tabs .show>.nav-link
	{
	color: #333
}

.navbar-nav .nav-pills .nav-link {
	color: #777
}

.navbar-nav .nav-pills .nav-link:not(.active):focus, .navbar-nav .nav-pills .nav-link:not(.active):hover
	{
	color: #333
}

.navbar-nav .nav-pills .nav-link.active .badge:not(.badge-mark) {
	background-color: #fff !important;
	color: #333 !important
}

.navbar-nav .nav-pills .nav-link.active .badge-mark[class*=bg-] {
	background-color: #fff !important;
	border-color: #fff !important
}

.navbar-nav .nav-pills .nav-link.active .badge-mark[class*=border-] {
	border-color: #fff !important
}

.navbar-nav .nav-pills .nav-link.active, .show:not(.navbar-collapse)>.navbar-nav .nav-pills .nav-link
	{
	color: #fff
}

.navbar-nav .nav-pills .nav-link.disabled:focus, .navbar-nav .nav-pills .nav-link.disabled:hover
	{
	color: #999
}

.navbar .btn-group .dropdown-menu-right {
	right: 0;
	left: auto
}

.dropdown-user .navbar-nav-link, .dropdown-user .navbar-nav-link>span {
	padding-top: .4375rem;
	padding-bottom: .4375rem
}

.img-flag {
	height: .875rem;
	margin-top: .18752rem;
	vertical-align: top;
	-ms-flex-item-align: start;
	align-self: flex-start
}

.mega-menu-left>.dropdown-menu {
	left: auto
}

.mega-menu-right>.dropdown-menu {
	left: auto;
	right: 0
}

.mega-menu-full>.dropdown-menu {
	left: 1.25rem;
	right: 1.25rem
}

.navbar-component .mega-menu-full>.dropdown-menu {
	left: 0;
	right: 0
}

.dropdown-content-header {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-pack: justify;
	justify-content: space-between;
	padding-left: 1.25rem;
	padding-right: 1.25rem;
	border-top-left-radius: .1875rem;
	border-top-right-radius: .1875rem
}

.dropdown-content-header:not([class*=bg-]) {
	padding-top: 1.25rem;
	padding-bottom: 1.25rem
}

.dropdown-content-header[class*=bg-] {
	padding-top: 1rem;
	padding-bottom: 1rem
}

.dropdown-content-header+.table, .dropdown-content-header+.table-responsive
	{
	border-top: 1px solid #ddd
}

.dropdown-content:not(ul) {
	padding-top: 0;
	padding-bottom: 0
}

.dropdown-content-body {
	padding: 1.25rem 1.25rem
}

.dropdown-content-header:not([class*=bg-])+.dropdown-content-body {
	padding-top: 0
}

.dropdown-content-footer {
	display: -ms-flexbox;
	display: flex;
	-ms-flex-align: center;
	align-items: center;
	padding: .75rem 1.25rem;
	border-top: 1px solid #ddd;
	border-bottom-right-radius: .1875rem;
	border-bottom-left-radius: .1875rem
}

.navbar-top {
	padding-top: 3.00003rem
}

.navbar-lg-top {
	padding-top: 3.25003rem
}

.navbar-sm-top {
	padding-top: 2.75003rem
}

.navbar-lg-md-top {
	padding-top: 6.25006rem
}

.navbar-md-md-top {
	padding-top: 6.00006rem
}

.navbar-sm-md-top {
	padding-top: 5.75006rem
}

.navbar-lg-sm-top {
	padding-top: 6.00006rem
}

.navbar-bottom {
	padding-bottom: 3.00003rem
}

.navbar-lg-md-bottom {
	padding-bottom: 6.25006rem
}

.navbar-md-md-bottom {
	padding-bottom: 6.00006rem
}

.navbar-sm-md-bottom {
	padding-bottom: 5.75006rem
}

.navbar-lg-sm-bottom {
	padding-bottom: 6.00006rem
}

.navbar-lg .navbar-brand {
	padding-top: 1.12502rem;
	padding-bottom: 1.12502rem
}

.navbar-lg .navbar-nav-link {
	padding: 1rem 1.25rem
}

.navbar-lg .navbar-nav-link .badge-mark {
	top: .5rem;
	right: .625rem
}

.navbar-lg .navbar-text {
	padding-top: 1rem;
	padding-bottom: 1rem
}

.navbar-lg .dropdown-user>.navbar-nav-link, .navbar-lg .dropdown-user>.navbar-nav-link>span
	{
	padding-top: .5rem;
	padding-bottom: .5rem
}

.navbar-lg .dropdown-user>.navbar-nav-link>img {
	max-height: 2.25003rem
}

.navbar-sm .navbar-brand {
	padding-top: .87502rem;
	padding-bottom: .87502rem
}

.navbar-sm .navbar-nav-link {
	padding: .75rem .875rem
}

.navbar-sm .navbar-nav-link .badge-mark {
	top: .375rem;
	right: .4375rem
}

.navbar-sm .navbar-text {
	padding-top: .75rem;
	padding-bottom: .75rem
}

.navbar-sm .dropdown-user>.navbar-nav-link, .navbar-sm .dropdown-user>.navbar-nav-link>span
	{
	padding-top: .375rem;
	padding-bottom: .375rem
}

.navbar-sm .dropdown-user>.navbar-nav-link>img {
	max-height: 2.00003rem
}

.navbar-header {
	margin-left: -1.25rem;
	margin-right: 1.25rem
}

.navbar-header .navbar-brand {
	margin-left: 1.25rem;
	margin-right: 0
}

.navbar-header .navbar-brand-xs {
	display: none
}

.sidebar-xs .navbar-header .navbar-brand-md {
	display: none
}

.sidebar-xs .navbar-header .navbar-brand-xs {
	display: inline-block;
	min-width: 3.5rem;
	margin-left: 0;
	text-align: center
}

.navbar-static {
	z-index: 100
}

.card {
	margin-bottom: 1.25rem;
	box-shadow: 0 1px 3px rgba(0, 0, 0, .12), 0 1px 2px rgba(0, 0, 0, .24);
	border-width: 0
}

.card.fixed-top {
	overflow: auto;
	max-height: 100%
}

.card-body:not(.card)+.card-body:not(.card) {
	border-top: 1px solid rgba(0, 0, 0, .125)
}

.card-title {
	position: relative
}

.card:not([class*=border-]) .card-header {
	border-top-left-radius: .1875rem;
	border-top-right-radius: .1875rem
}

.card-header .card-title {
	margin-bottom: 0
}

.card[class*=bg-]:not(.bg-light):not(.bg-white):not(.bg-transparent) .card-header
	{
	border-bottom-color: rgba(255, 255, 255, .1)
}

.card-header:not([class*=bg-]):not([class*=alpha-]) {
	background-color: transparent;
	padding-top: 1.25rem;
	padding-bottom: 1.25rem;
	border-bottom-width: 0
}

.card-header:not([class*=bg-]):not([class*=alpha-])+*>.card-body:first-child,
	.card-header:not([class*=bg-]):not([class*=alpha-])+.card-body {
	padding-top: 0
}

.card-footer:first-child, .card-header+*>.card-footer:first-child,
	.card-header+.card-footer {
	border-top: 0;
	border-bottom: 1px solid rgba(0, 0, 0, .125)
}

.card-footer.border-bottom-1 {
	border-bottom: 1px solid rgba(0, 0, 0, .125)
}

.card-header-tabs {
	margin-bottom: 0
}

.card-header-tabs .nav-link {
	border-top-width: 0
}

.card-body .card-img {
	border-radius: .1875rem
}

body {
	margin: 0;
	font-family: 'NanumBarunGothic', Roboto, -apple-system,
		BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial,
		sans-serif, "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol",
		"Noto Color Emoji";
	font-size: .9375rem;
	font-weight: 400;
	line-height: 1.5385;
	color: #333;
	text-align: left;
	background-color: #f5f5f5
}
</style>

<%--<div id="preloader">--%>
<%--    <div id="status">--%>
<%--        <img src="${pageContext.request.contextPath}/resources/images/loader.gif" id="preloader_image" alt="loader">--%>
<%--    </div>--%>
<%--</div>--%>
<!-- hs Navigation Start -->
<!-- Main navbar -->


<div class="navbar navbar-expand-lg bg-white navbar-slide-top fixed-top"
	style="height: 122px;">
	<div class="container">

		<div class="navbar-brand">
			<a href="${pageContext.request.contextPath}/" class="d-inline-block">
				<img
				src="${pageContext.request.contextPath}/resources/images/Logo.svg"
				alt="logo" class="h-auto" style="width: 100px;">
			</a>
		</div>

		<div class="d-lg-none">
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbar-mobile">
				<i class="icon-tree5"></i>
			</button>
			<button class="navbar-toggler sidebar-mobile-main-toggle"
				type="button">
				<i class="icon-paragraph-justify3"></i>
			</button>
		</div>

		<div class="collapse navbar-collapse" id="navbar-mobile">
			<ul class="h5 navbar-nav">
				<li class="nav-item"><a
					class="navbar-nav-link d-none d-md-block text-dark"
					href="${pageContext.request.contextPath}/">홈</a></li>
				<li class="nav-item"><a
					class="navbar-nav-link d-none d-md-block text-dark"
					href="${pageContext.request.contextPath}/commonRent">일반 렌트</a></li>
				<li class="nav-item"><a
					class="navbar-nav-link d-none d-md-block text-dark"
					href="${pageContext.request.contextPath}/premiumRent/estimate">프리미엄
						렌트</a></li>
				<li class="nav-item"><a
					class="navbar-nav-link d-none d-md-block text-dark"
					href="${pageContext.request.contextPath}/notice/list">공지사항</a></li>
				<li class="nav-item dropdown"><a href="#"
					class="navbar-nav-link dropdown-toggle text-dark"
					data-toggle="dropdown">커뮤니티</a>
					<div class="dropdown-menu">
						<a href="${pageContext.request.contextPath}/notice/list"
							class="dropdown-item"> 공지사항</a> <a
							href="${pageContext.request.contextPath}/community/course"
							class="dropdown-item"> 여행코스</a> <a
							href="${pageContext.request.contextPath}/community/tour"
							class="dropdown-item"> 여행지</a> <a
							href="${pageContext.request.contextPath}/qna/insert"
							class="dropdown-item"> 1:1 문의</a> <a
							href="${pageContext.request.contextPath}/faq/list"
							class="dropdown-item"> FAQ</a>
					</div></li>
				<li class="nav-item"><a
					class="navbar-nav-link d-none d-md-block text-dark"
					href="${pageContext.request.contextPath}/mypage/dashboard">마이페이지</a></li>
			</ul>
			<ul class="navbar-nav align-items-center ml-md-auto">
				<sec:authorize access="isAnonymous()">
					<li class="nav-item dropdown"><a
						href="${pageContext.request.contextPath}/login" class="btn"
						style="color: #fff; background-color: #6495ed;">로그인</a></li>
				</sec:authorize>

				<sec:authorize access="isAuthenticated()">
					<li class="nav-item dropdown dropdown-user"><a href="#"
						class="navbar-nav-link d-flex align-items-center dropdown-toggle"
						data-toggle="dropdown"> <img
							src="${pageContext.request.contextPath}/resources/images/avatar.jpg"
							class="rounded-circle mr-2" height="34" alt=""> <span
							style="color: #6495ed"><sec:authentication property="name" /></span>
					</a>
						<div class="dropdown-menu dropdown-menu-right"
							style="padding: .5rem 1.5rem;">
							<a href="#" class="dropdown-item"><i class="icon-user-plus"></i>
								마이페이지</a>
							<sec:authorize access="hasRole('COMPANY')">
								<a href="${pageContext.request.contextPath}/company/dashboard"
									class="dropdown-item"><i class="icon-gear"></i> 업체 관리</a>
							</sec:authorize>
							<sec:authorize access="hasRole('ADMIN')">
								<a href="${pageContext.request.contextPath}/admin/dashboard"
									class="dropdown-item"><i class="icon-gear"></i> 사이트 관리</a>
							</sec:authorize>
							<a href="#" class="dropdown-item"><i class="icon-car"></i> 렌트
								내역</a> <a href="#" class="dropdown-item"><i
								class="icon-newspaper2"></i> 견적 내역</a>
							<div class="dropdown-divider"></div>
							<a href="#" class="dropdown-item"><i class="icon-gear"></i>
								정보 수정</a> <a id="logOutBtn" href="#" class="dropdown-item"><i
								class="icon-switch2"></i> 로그아웃</a>
						</div></li>
					<form action="${pageContext.request.contextPath}/logout"
						method="post" id="logoutFrm" name="logoutFrm">
						<sec:csrfInput />
					</form>
				</sec:authorize>
			</ul>
		</div>
	</div>
</div>
<!-- /main navbar -->
<script>
    <c:if test="${resultMsg != null}">
        customAlert('<c:out value="${resultTitle}" default="알림" />' , "${resultMsg}");
    </c:if>
    <c:if test="${alertMsg != null}">
        customAlert('<c:out value="${alertTitle}" default="알림" />', '${alertMsg}');
    </c:if>
<%--    <c:if test="${deleteMsg != null}">--%>
<%--    customAlert("견적 삭제", "${deleteMsg}");--%>
<%--    </c:if>--%>

    $(function(){
		$('#logOutBtn').on("click",function(){
			logoutFrm.submit();
		});
	});
</script>
