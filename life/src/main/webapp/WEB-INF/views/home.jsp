<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Stylish Portfolio - Start Bootstrap Template</title>

  <!-- Bootstrap Core CSS -->
  <link href="resources/hf/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom Fonts -->
  <link href="resources/hf/vendor/font/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
  <link href="resources/hf/vendor/sli/css/simple-line-icons.css" rel="stylesheet">

  <!-- Custom CSS -->
  <link href="resources/hf/css/stylish-portfolio.min.css" rel="stylesheet">
  
  <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/css/bootstrap-theme.min.css">
  <script src="../resources/js/bootstrap.min.js">
  </script>
  <script src="resources/js/water.js"></script>
  	
  <script type="text/javascript">
function login(){
	window.open('member/login','goLogin','top=200, left=300,  width=400, height=400');
	
}

</script>

</head>

<body id="page-top">

  <!-- Navigation -->
  <a class="menu-toggle rounded" href="#">
    <i class="fas fa-bars"></i>
  </a>
  <nav id="sidebar-wrapper">
    <ul class="sidebar-nav">
      <li class="sidebar-brand">
        <h6 class="js-scroll-trigger" >
        ${sessionScope.loginName}(${sessionScope.loginId})님 로그인 중</h6>
        <a href="member/logout" style="font-size:13px">(로그아웃)</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#page-top">Home</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#about">With us</a>
      </li>
      <li class="sidebar-nav-item">
        <a class="js-scroll-trigger" href="#services">Services</a>
      </li>
      <c:if test="${sessionScope.loginId!=null}">
      <li class="sidebar-nav-item">
        <a href ="member/update">New Info</a>
      </li>
      </c:if>
    </ul>
  </nav>

  <!-- Header -->
  <header class="masthead d-flex">
    <div class="container text-center my-auto">
      <h1 class="mb-1">Marine Life</h1>
      <h3 class="mb-5">
        <em>Let me introduce our friends.</em>
      </h3>
      <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Find Out More</a>
    </div>
    <div class="overlay"></div>
  </header>

  <!-- view -->
  <section class="content-section bg-light" id="about">
    <div class="container text-center">
      <div class="row">
        <div class="col-lg-10 mx-auto">
          <h2>Do you want more information?</h2>
          <h3><a href="member/insert1">Join</a></h3><br>
          <a class="btn btn-dark btn-xl js-scroll-trigger" href="#services">What We Offer</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Services -->
  <section class="content-section bg-primary text-white text-center" id="services">
    <div class="container">
      <div class="content-section-heading">
        <h3 class="text-secondary mb-0">Services</h3>
        <c:if test="${sessionScope.loginId==null }">
        <h2 class="mb-5">Do you want more?</h2>    
        </c:if>
        <c:if test="${sessionScope.loginId!=null}">
        <h2 class="mb-5">What We Offer</h2>		      
        </c:if>
      
      </div>
      <div class="row">
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-like"></i>
          </span>
          <h4>
            <c:if test="${sessionScope.loginId==null }">
           <input type="button"  class="btn btn-info btn-lg" onclick="login()" value="Login">
           </c:if>
            <c:if test="${sessionScope.loginId!=null}">
            <input type = "button" class="btn btn-info btn-lg" disabled="disabled" value="login">
            </c:if>
            
          </h4>
        </div>
        <div class="col-lg-3 col-md-6 mb-5 mb-lg-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-screen-smartphone"></i>
          </span>
          <h4>
            <strong>
            <a class="btn btn-primary" href="service/search" role="button">Search</a>
            </strong>
          </h4>
        </div>
        <div class="col-lg-3 col-md-6 mb-5 mb-md-0">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-pencil"></i>
          </span>
          <h4>
            <strong>
			<a class="btn btn-primary" href="board/insert" role="button">Board</a>
			</strong>
          </h4>
        
        </div>
        <div class="col-lg-3 col-md-6">
          <span class="service-icon rounded-circle mx-auto mb-3">
            <i class="icon-mustache"></i>
          </span>
          <h4>
            <strong>
            <a class="btn btn-primary" href="guestbook/list" role="button">Guest</a>
            </strong>
          </h4>
        </div>
      </div>
    </div>
  </section>

  <!-- Callout -->
  <section class="callout">
    <div class="container text-center">
      <h2 class="mx-auto mb-5">
      
      	Happy Life
        
        </h2>
      <a class="btn btn-primary btn-xl" href="service/fun">FUN~!</br>
      (click&count)</a>
    </div>
  </section>

  
  
 

  <!-- Scroll to Top Button-->
  <a class="scroll-to-top rounded js-scroll-trigger" href="#page-top">
    <i class="fas fa-angle-up"></i>
  </a>

  <!-- Bootstrap core JavaScript -->
  <script src="resources/hf/vendor/jquery/jquery.min.js"></script>
  <script src="resources/hf/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Plugin JavaScript -->
  <script src="resources/hf/vendor/je/jquery.easing.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="resources/hf/js/stylish-portfolio.min.js"></script>

</body>

</html>
