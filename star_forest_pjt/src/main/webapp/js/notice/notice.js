/*
게시물 리스트 변경
*/
function changeQnaList(pageno){
	console.log(pageno);
	$.ajax({
		url: "notice_list_rest",
		method: "post",
		data: {"pageno" :pageno},
		dataType: "json",
		success:function(resultObj){
			console.log(resultObj);
			if(resultObj.errorCode > 0){
				let data = resultObj.data;
				let htmlBuffer = ``;
				data.itemList.forEach(function(notice, i){
					
	                if(notice.setting == 1){
						htmlBuffer += `<tr><th>&nbsp;&nbsp;<img src="img/notice.png" width="20" height="20"></th>`
					}
	                if(notice.setting == 0){
						htmlBuffer += `<tr><th>&nbsp;&nbsp;<span class="badge badge-normal"></th>`
					}
	                               
					htmlBuffer += `
	                               	<th>${notice.notice_no}</th>
	                                <th><a href="notice_detail?notice_no=${notice.notice_no}&pageno=${data.pageMaker.curPage}">${notice.notice_title}</a>`;
	                
                    htmlBuffer += `</th>
	                                    <th>${notice.notice_date.substring(0,10)}</th>
	                                    <th>${notice.notice_readcount}</th>
	                                     `
	                                   
		                                       
				});
				$("#notice_list_tbody").html(htmlBuffer);
				let paginationBuffer = ``;
				if(data.pageMaker.prevPage > 0){
					paginationBuffer += `<li class="page-item">
		                                    <button class="page-link" onclick="changeQnaList(${data.pageMaker.prevPage});"><i class="fa fa-angle-left" aria-hidden="true"></i></button>
		                               	 </li>`;
				}
				for(let no = data.pageMaker.blockBegin; no <= data.pageMaker.blockEnd; no++){
					if(data.pageMaker.curPage == no){
						paginationBuffer += `<li class="page-item active"><button class="page-link" href="#">${no}</button></li>`;
					}
					if(data.pageMaker.curPage != no){
						paginationBuffer += `<li class="page-item"><button class="page-link" onclick="changeQnaList(${no});">${no}</button></li>`;
					}
				}
				if(data.pageMaker.curPage < data.pageMaker.totPage){
					paginationBuffer += `<li class="page-item">
					                        <button class="page-link" onclick="changeQnaList(${data.pageMaker.nextPage});"><i class="fa fa-angle-right" aria-hidden="true"></i></button>
				                    	 </li>`;
				}
				$(".pagination.pagination-sm.justify-content-center").html(paginationBuffer);
			}else{
				Toast.fire({ icon: 'error', title: resultObj.errorMsg });
			}
		}
	});
}

/*
게시글 목록 이동
*/

$("#ddd").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = `notice_list?pageno=${pageno}`;
	console.log(pageno);
});

/*
게시글 삭제 
*/
/*
$("#ccc").on("click", function(){
	let notice_no = $(this).attr("notice_no");
	let pageno = $(this).attr("pageno");
	location.href = `notice_modify_form?notice_no=${notice_no}&pageno=${pageno}`;
});
*/
$("#ccc").on('click', function(e){
			var param = 'notice_no='+$(e.target).attr('notice_no');
			console.log(param);
			$.ajax({
				
				url:'notice_delete_action',
				method:'POST',
				data: param,
				success:function(jsonResult){
					
					console.log(jsonResult);
					if(jsonResult.code==1){
							Swal.fire({
                    title: '',  text: jsonResult.msg,
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인'
                  }).then((result) => {
                    if (result.isConfirmed) {
						location.href="notice_list;"
                    }
                  })
						//$('#btn_request_list').trigger('click');
						//location.href='notice_list';
					}else if(code==2){
						Swal.fire({
                    title: '',  text: jsonResult.msg,
                    icon: 'error',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인'
                  }).then((result) => {
                    if (result.isConfirmed) {
                    }
                  })
					}else if(code==0){
						Swal.fire({
                    title: '',  text: jsonResult.msg,
                    icon: 'error',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인'
                  }).then((result) => {
                    if (result.isConfirmed) {
                    }
                  })
					}
				}
				
			});
		});
/*
게시글 수정 폼 
*/
$("#aaa").on("click", function(){
	let notice_no = $(this).attr("notice_no");
	let pageno = $(this).attr("pageno");
	location.href = `notice_modify_form?notice_no=${notice_no}&pageno=${pageno}`;
});

/* 
게시글 수정 
*/ 
$("#asd").on("click", function(){ 
	var param = $('#notice_modify_form').serialize();
	console.log(param);
	
	$.ajax({
		url:'notice_modify_action',
		method:'POST',
		data:param,
		success:function(jsonResult){
			var item = jsonResult.data;
					if(jsonResult.code==1){
					var param = 'notice_no='+$("#notice_modify_from input[name='notice_no']").val();
						Swal.fire({
                    title: '',  text: jsonResult.msg,
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인'
                  }).then((result) => {
                    if (result.isConfirmed) {
					location.href = `notice_detail?notice_no=${item}&pageno=1`;
                    }
                  })
					}else if(jsonResult.code==2){
						Swal.fire({
                    title: '',  text: jsonResult.msg,
                    icon: 'error',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인'
                  }).then((result) => {
                    if (result.isConfirmed) {
                    }
                  })
					}
		}
	})
	let notice_no = $(this).attr("notice_no");
});

/*
$(document).on('click','#btn_request_modify_action',function(e){
         var param=$('#request_modify_form').serialize();
         console.log(param);
         $.ajax({
            url:'request_modify_action',
            method:'POST',
            data:param,
            success: function(jsonResult){
               console.log(jsonResult);
               if(jsonResult.code==1){
                  var param ='board_no='+$("#request_modify_form input[name='board_no']").val();
                  $.ajax({
                      url:'request_view_json',
                      method:'GET',
                      dataType:'json',
                        data:param,
                      success:function(jsonResult){
                         $('#requestBoard_wrap').html(request_view(jsonResult.data[0]));
                      }
                 
                  });
*/
/*
새글 등록 폼 
*/
/*
$("#fff").on("click", function(){
	let pageno = $(this).attr("pageno");
	location.href = "notice_write_form?pageno=" + pageno;
});
*/

/*
게시글 등록
*/
$("#fff").on("click", function(){
	var param = $('#notice_write_form').serialize();
	console.log(param);
	$.ajax({
		url:'notice_write_action',
		method:'POST',
		data:$('#notice_write_form').serialize(),
		success:function(jsonResult){
			console.log(jsonResult);
			//e.preventDefault();
			 
			if(jsonResult.code==1){
				//$('#ddd').trigger('click');
				Swal.fire({
                    title: '',  text: jsonResult.msg,
                    icon: 'success',
                    showCancelButton: false,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: '확인'
                  }).then((result) => {
                    if (result.isConfirmed) {
							location.href="notice_list;"
                    }
                  })
			}
		}
	})
});

/*
게시글 등록시 체크에 따라 고정글 설정
*/
/*
if(document.getElementById("setting").checked) {
    document.getElementById("setting_hidden").disabled = true;
}
*/

/*
일반 회원일때 등록, 수정, 삭제 버튼 숨기기
*/
$()

/*
ckeditor
*/

