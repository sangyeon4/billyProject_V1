<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Bootstrap Example</title>

  </head>
  <body class="p-3 m-0 border-0 bd-example">
    <!-- Example Code -->
   <table>
      <c:forEach items="2" var="2">
         <tr>
            <td>
               <a href="#"><div class="card mb-3" style="max-width: 270px;">
                  <div class="row g-0">
                     <div class="col-md-4">
                        <svg class="bd-placeholder-img img-fluid rounded-start"
                           width="100%" height="100" xmlns="http://www.w3.org/2000/svg"
                           role="img" aria-label="Placeholder: Image"
                           preserveAspectRatio="xMidYMid slice" focusable="false">
          <title>Placeholder</title>
          <rect width="100%" height="100%" fill="#868e96"></rect>
          <text x="50%" y="50%" fill="#dee2e6" dy=".3em">Image</text>
          </svg>
                     </div>
                     <div class="col-md-8">
                        <div class="card-body">
                           <h5 class="card-title">Card title</h5>
                           <p class="card-text"></p>
                           <p class="card-text">
                              <small class="text-muted">상세정보</small>
                           </p>
                        </div>
                     </div>
                  </div>
               </div></a>
            </td>
         </tr>
      </c:forEach>
   </table>
  </body>
</html>
