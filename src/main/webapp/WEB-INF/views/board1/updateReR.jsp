<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="<%=request.getContextPath()%>/resources/bootstrap/css/bootstrap.min.css"
		rel="stylesheet" type="text/css">
	<script src="https://code.jquery.com/jquery-latest.js"></script>

	<title>댓글 수정</title>
	  <style>
        /* The Modal (background) */
        .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }
    
        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 30%; /* Could be more or less, depending on screen size */                          
        }
 
</style>


</head>
<body>


 <form role="form" method="post" action='<%=request.getContextPath()%>/board1/updateRR?num=${num}&rnum=${rnum}&page=${page}'>
      
	<div id="myModal" class="modal">
 
      <!-- Modal content -->
      		
      		<input type="hidden" name="num" value="${num}"/>
			<input type="hidden" name="page" value="${page}"/>
			<input type="hidden" name="rnum" value="${rnum}"/>
      
      <div class="modal-content">
                <p style="text-align: center;"><span style="font-size: 14pt;"><b><span style="font-size: 24pt;">댓글 수정</span></b></span></p>
                	
                	<div class="modal-body">
							<table class="table">
								<tr>
									<td>글쓴이</td>
									<td><input class="form-control" id="modalWriter"  type="text" name="writer" readonly="readonly" value="${replyVO.writer}"></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><textarea class="form-control" id="modalCon" rows="10" name="content"> ${replyVO.content} </textarea></td>
								</tr>					
							</table>
						</div>
                
                
                
                <p><br /></p>
           
           <input id="modalSubmit"  type="submit" class="btn btn-success"  value="SUBMIT" >
            
            <button  id="closePop" onclick="document.location.href='<%=request.getContextPath()%>/board1/read?num=${num}&page=${page}'"> Close </button>
            
      </div>
      
      
    </div>

    </form>




 <script type="text/javascript">
      
 $(window).load(function(){
  
        $('#myModal').show();
        
    });
 
	$(document).ready(function(){
		var formObj = $("form[role='form']");
		console.log(formObj);
		
		$("#modalSubmit").on("click",function(){
			formObj.submit();
		});
	});

 
        
        
    </script>



</body>
</html>















