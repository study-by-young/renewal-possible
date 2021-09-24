<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Limitless - Responsive Web Application Kit by Eugene
	Kopyov</title>

<!-- Global stylesheets -->
<link
	href="https://fonts.googleapis.com/css?family=Roboto:400,300,100,500,700,900"
	rel="stylesheet" type="text/css">
<link href="../../../../global_assets/css/icons/icomoon/styles.min.css"
	rel="stylesheet" type="text/css">
<link href="assets/css/bootstrap.min.css" rel="stylesheet"
	type="text/css">
<link href="assets/css/bootstrap_limitless.min.css" rel="stylesheet"
	type="text/css">
<link href="assets/css/layout.min.css" rel="stylesheet" type="text/css">
<link href="assets/css/components.min.css" rel="stylesheet"
	type="text/css">
<link href="assets/css/colors.min.css" rel="stylesheet" type="text/css">
<!-- /global stylesheets -->

<!-- Core JS files -->
<script src="../../../../global_assets/js/main/jquery.min.js"></script>
<script src="../../../../global_assets/js/main/bootstrap.bundle.min.js"></script>
<script
	src="../../../../global_assets/js/plugins/loaders/blockui.min.js"></script>
<!-- /core JS files -->

<!-- Theme JS files -->
<script src="assets/js/app.js"></script>
<!-- /theme JS files -->

</head>

<body>

	<!-- Striped rows -->
	<div class="card">
		<div class="card-header header-elements-inline">
			<h5 class="card-title">Striped rows</h5>
			<div class="header-elements">
				<div class="list-icons">
					<a class="list-icons-item" data-action="collapse"></a> <a
						class="list-icons-item" data-action="reload"></a> <a
						class="list-icons-item" data-action="remove"></a>
				</div>
			</div>
		</div>

		<div class="card-body">
			Example of a table with
			<code>striped</code>
			rows. Use
			<code>.table-striped</code>
			added to the base
			<code>.table</code>
			class to add zebra-striping to any table odd row within the
			<code>&lt;tbody&gt;</code>
			. This styling doesn't work in IE8 and lower as
			<code>:nth-child</code>
			CSS selector isn't supported in these browser versions. Striped table
			can be combined with other table styles.
		</div>

		<div class="table-responsive">
			<table class="table table-striped">
				<thead>
					<tr>
						<th>#</th>
						<th>First Name</th>
						<th>Last Name</th>
						<th>Username</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>Eugene</td>
						<td>Kopyov</td>
						<td>@Kopyov</td>
					</tr>
					<tr>
						<td>2</td>
						<td>Victoria</td>
						<td>Baker</td>
						<td>@Vicky</td>
					</tr>
					<tr>
						<td>3</td>
						<td>James</td>
						<td>Alexander</td>
						<td>@Alex</td>
					</tr>
					<tr>
						<td>4</td>
						<td>Franklin</td>
						<td>Morrison</td>
						<td>@Frank</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<!-- /striped rows -->
</body>
</html>