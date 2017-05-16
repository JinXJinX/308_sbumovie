<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="header.jsp" flush="true" />
<link href="css/resultpage.css" rel="stylesheet">
<body>
    <div class="container">
      <div class="row" style="background-color: ">

      <div class="gallery col-lg-12 col-md-12 col-sm-12 col-xs-12">

                <h1 class="gallery-title">Showing Results for "<c:out value="${query}"/>"</h1>

      </div>

      <div class="col-md-1"></div>

      <div class="col-md-10" >
            <div class="row">
              <!--movies start here-->


              <c:forEach items="${movies}" var="movie" varStatus="status1">
                  <c:if test="${status1.index < 20}">

                  <div class="gallery_product filter all movies">

                          <div class="row">
                          <div class="item">
                              <div class="item col-md-3">

                              <img class="item-image" src="${movie.mainImagePath}" alt="${movie.title}">
                              </div>


                              <div class="item-detail col-md-9">
                                  <div class="col-md-5">
                                      <br>
                                      <div class="item-title">
                                          <h4><a href="movieDetail.do?movieId=${movie.id}" class="nav-link"><c:out value="${movie.title}"/></a></h4>
                                      </div>
                                      <h6><i><c:out value="${movie.releaseDate}"/></i></h6>
                                      <br>
                                      <div class="ratings">
                                          <p>
                                            <c:forEach  var = "i" begin="2" end="10" step="2">
                                            <c:choose>
                                                  <c:when test="${ i < movie.fanRating }">
                                                    <span class="glyphicon glyphicon-star"></span>
                                                  </c:when>
                                                  <c:otherwise>
                                                    <span class="glyphicon glyphicon-star-empty"></span>
                                                  </c:otherwise>
                                              </c:choose>
                                            </c:forEach>
                                          </p>
                                      </div>
                                      <br>
                                      <br>
                                      <h5><c:out value="${movie.length} min"/> </h5>
                                      <h5><c:out value="${movie.genre}"/></h5>

                                  </div>
                                  <!-- <button type="button" class="pull-right btn">Buy Tickets</button> -->
                              </div>
                          </div>
                    </div>
                </div>

                  </c:if>
              </c:forEach>

              <!--movies ends here-->

              <!--actors start here-->

              <c:forEach items="${actors}" var="actor" varStatus="status1">
                  <c:if test="${status1.index < 20}">

                  <div class="gallery_product filter all actors">
                      <div class="row">

                          <div class="item">

                              <div class="item col-md-3" >
                                  <img class="item-image" src="${actor.mainImagePath}" alt="">
                              </div>


                              <div class="item-detail col-md-9">
                                  <div class="col-md-5">
                                      <br>
                                      <div class="item-title">
                                          <h4><a href="actorpage.html" class="nav-link"><c:out value="${actor.name}"/></a></h4>
                                      </div>
                                      <h5>Born: <c:out value="${actor.dob}"/> <c:out value="in ${actor.birthPlace}"/></h5>
                                      <br>
                                      <h5>Occupation: Actor</h5>
                                      <br>

                                      <br>

                                  </div>
                              </div>
                          </div>

                      </div>
                  </div>

                </c:if>
            </c:forEach>

              <!--actors end here-->

              <!--theater starts here-->
              <c:forEach items="${theater}" var="t" varStatus="status1">
                  <li class="list-group-item">
                  <div class="gallery_product filter all theaters">
                      <div class="row">

                          <div class="item">
                              <!-- <div class="item col-md-3" style="background-color:">
                                  <img class="item-image" src="img/theater.jpg" alt="">
                              </div> -->
                              <div class="item-detail col-md-9">
                                  <div class="col-md-5">
                                      <br>
                                      <div class="item-title">
                                          <h4>${t.name }</h4>
                                      </div>
                                        <br>
                                      <br>
                                      <h5><a href="theater.do?theaterId=${t.id}" class="nav-link">${t.address }</a></h5>
                                  </div>
                              </div>
                          </div>

                      </div>
                  </div>
              </li>
            </c:forEach>
              
              <!--theater ends here-->

              <!--news start here-->
              <c:forEach items="${reviews}" var="review" varStatus="status1">
                  <c:if test="${status1.index < 20}">


              <li class="list-group-item">
                  <div class="gallery_product filter all reviews">
                      <div class="row">
                            <article>
                                <div class="row">
                                        <div class="col-sm-6 col-md-4">
                                            <figure>
                                                <img src="img/photo1.jpg">
                                            </figure>
                                        </div>
                                        <div class="col-sm-6 col-md-8">
                                            <span class="label label-default pull-right"><i class="glyphicon glyphicon-comment"></i>50</span>
                                            <h4>${review.title}</h4>
                                            <p>In the upcoming Tallulah,
                                                            Ellen Page stars as a young woman in desperate
                                                            straits who ends up caring for a stranger's baby.
                                                            The first trailer establishes the premise and the leading characters,
                                                            including Allison Janney and Tammy Blanchard. </p>
                                            <section>
                                                <i class="glyphicon glyphicon-user"></i>Author name
                                                <i class="glyphicon glyphicon-calendar"></i>2017/4/17
                                                <i class="glyphicon glyphicon-eye-open"></i>10000
                                                <a href="#" class="btn btn-default btn-sm pull-right">More ... </a>
                                            </section>
                                        </div>
                                </div>
                            </article>
                      </div>
                  </div>
              </li>

                  </c:if>
              </c:forEach>
              <!--news end here-->


          </ul>
      </div>

    </div>
  </div>
</div>

</body>
<jsp:include page="footer.jsp" flush="true" />
