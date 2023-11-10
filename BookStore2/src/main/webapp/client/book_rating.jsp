<c:forTokens items="${book.ratingStars}" delims="," var="star">
                     <c:if test="${star eq 'on'}">
                        <img src="../img/rating_on.png"/>
                     </c:if>
                     <c:if test="${star eq 'off'}">
                        <img src="../img/rating_off.png"/>
                     </c:if>
                      <c:if test="${star eq 'half'}">
                        <img src="../img/rating_half.png"/>
                     </c:if>
 </c:forTokens>