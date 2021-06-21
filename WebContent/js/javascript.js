
$(function() {
		$(".Sub_nav").on("click", function() {
			$(this).parent().siblings('ul').slideToggle("fast");
		});

		$("#insert_category").on("click", function() {		
			if (window.confirm("생성하시겠습니까?")) {
				$(this).attr("hidden",true);
				$(this).parent().siblings().removeAttr("hidden");
				$(this).parent().siblings("#new_category").focus();
				
				$("#insert_category2").on("click",function(){
					if (window.confirm("카테고리 명을 사용 하시겠습니까?")) {
						$("#index").attr("action","LeftSideController.do?type=insert");
						$("#index").submit();
					}else{
						$(this).attr("hidden",true);
						$("#new_category").attr("hidden",true);
						$("#insert_category").removeAttr("hidden");
					}
				});
					
			}
		});
		
		$(".update_category").on("click", function() {
			var category_num = $(this).siblings(".Sub_nav").children("#category_num").val();
			if (window.confirm("선택한 카테고리 명을 바꾸시겠습니까?")) {
				
				$(this).parent().find(".title").removeAttr("disabled").focus();
				$(this).prev().children().removeAttr("hidden");
				
				$(this).prev().children().on("click",function(){
					if (window.confirm("변경하시겠습니까?")){
						$("#index").attr("action","LeftSideController.do?type=update&category_num="+category_num);
						$("#index").submit();
					}
				});
			}
		});
		$(".delete_category").on("click",function(){
			var category_num = $(this).siblings(".Sub_nav").children("#category_num").val();
			if (window.confirm("선택한 카테고리 명을 삭제 하시겠습니까?")) {
				$("#index").attr("action","LeftSideController.do?type=delete&category_num="+category_num);
				$("#index").submit();
			}
		});
		
		$(".insert_subheading").on("click", function() {		
			
			if (window.confirm("추가 하시겠습니까?")) {
				$(this).attr("hidden",true);
				$(this).parent().parent().siblings().removeAttr("hidden");
				$(this).parent().parent().siblings("#new_subheading").focus();
				
				$(this).parent().parent().siblings(".insert_subheading2").on("click",function(){
					var category_num = $(this).siblings().find("#category_num").val();
					var new_subheading =$(this).prev().val(); 
					if (window.confirm("이대로 설정 하시겠습니까?")) {
						$("#index").attr("action","LeftSideController.do?type=s_insert&category_num="+category_num+"&new_subheading="+new_subheading);
						$("#index").submit();
					}
				});
					
			}
		});
		
		$(".update_subheading").on("click",function(){
			
			var subheading_num = $(this).parent().parent().siblings(".subheading_num").val();	
			$(this).parent().parent().siblings(".show_subheading").attr("hidden",true);
			$(this).parent().parent().siblings(".subheading").removeAttr("disabled")
			$(this).parent().parent().siblings(".subheading").removeAttr("hidden").focus();
			$(this).parent().parent().siblings(".update_subheading2").removeAttr("hidden");
				
			$(this).parent().parent().siblings(".update_subheading2").on("click",function(){
				if(confirm("수정하시겠습니까?")){
					
					$("#index").attr("action","LeftSideController.do?type=s_update&subheading_num="+subheading_num);
					$("#index").submit();
				}
			});
		});
		
		$(".delete_subheading").on("click",function(){
			var subheading_num = $(this).parent().parent().siblings(".subheading_num").val();
			if(confirm("삭제하시겠습니까?")){
				$("#index").attr("action","LeftSideController.do?type=s_delete&subheading_num="+subheading_num);
				$("#index").submit();
			}
		});
});
