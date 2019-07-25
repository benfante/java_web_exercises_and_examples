<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<t:plainPage title="Login">

	<!-- login area start -->
	<div class="login-area">
		<div class="container">
			<div class="login-box ptb--100">
				<form action="${baseURL}/login" method="post">
					<div class="login-form-head">
						<h4>Benvenuto</h4>
						<p>Inserisci credenziali.</p>
						<c:if test="${param['error'] != null}">
							<div class="alert alert-danger" role="alert">Invalid username and password.</div>
						</c:if>
						<c:if test="${param['logout'] != null}">
							<div class="alert alert-success" role="alert">You have been logged out.</div>
						</c:if>
					</div>
					<div class="login-form-body">

						<div class="form-gp">
							<label for="user">Username</label> <input type="text" id="user"
								name="username"> <i class="ti-user"></i>
						</div>
						<div class="form-gp">
							<label for="exampleInputPassword1">Password</label> <input
								type="password" id="exampleInputPassword1" name="password">
							<i class="ti-lock"></i>
						</div>
						<div class="row mb-4 rmber-area">
							<div class="col-6">
								<div class="custom-control custom-checkbox mr-sm-2">
									<input type="checkbox" class="custom-control-input"
										id="customControlAutosizing"> <label
										class="custom-control-label" for="customControlAutosizing">Ricordami</label>
								</div>
							</div>
						</div>
						<div class="submit-btn-area">
							<button id="form_submit" type="submit">
								Accedi <i class="ti-arrow-right"></i>
							</button>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- login area end -->
</t:plainPage>
