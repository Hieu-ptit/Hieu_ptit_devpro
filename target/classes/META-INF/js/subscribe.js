var sub = {
		
		chon_san_pham_dua_vao_gio_hang: function(maSanPham, soluong) {
			var data = {};
			data["maSanPham"] = maSanPham;
			data["soluong"] = soluong;
			
			$.ajax({
				url: "/chon-san-pham-dua-vao-gio-hang",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if(jsonResult.status == 200) {
						//alert(jsonResult.data);
						// clear data
						$("#thong_tin_gio_hang").html(jsonResult.data);
					} else {
						alert('loi');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		},
		
		sua_san_pham_tu_gio_hang: function(maSanPham, soluong) {
			var data = {};
			data["maSanPham"] = maSanPham;
			data["soluong"] = soluong;
			
			$.ajax({
				url: "/sua-san-pham-dua-vao-gio-hang",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if(jsonResult.status == 200) {
						//alert(jsonResult.data);
						// clear data
						location.reload();
						$("#thong_tin_gio_hang").html(jsonResult.data);
					} else {
						alert('loi');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		},


      xoa_san_pham_tu_gio_hang: function(maSanPham) {
			var data = {};
			data["maSanPham"] = maSanPham;
			
			$.ajax({
				url: "/xoa-san-pham-dua-vao-gio-hang",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					if(jsonResult.status == 200) {
						location.reload();
						$("#thong_tin_gio_hang").html(jsonResult.data);
					} else {
						alert('loi');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		},
		




    saveSubscribe:function(){
          var data = {};
          data["email"] = $("#email1").val();
          data["firstname"] = $("#fname").val();
          data["phone"] = $("#phone1").val();
        $.ajax({
				url: "/save-subscribe-with-ajax",
				type: "post",
				contentType: "application/json", // dữ liệu gửi lên web-service có dạng là json.
				data: JSON.stringify(data), // object json -> string json
				
				dataType: "json", // dữ liệu từ web-service trả về là json.
				success: function(jsonResult) { // được gọi khi web-service trả về dữ liệu.
					//alert(jsonResult.message);
					//$("#message").html(jsonResult.data);
					//$('#blogModal').modal('show');
					if(jsonResult.status == 200) {
						alert(jsonResult.data);
						$("#fname").val("");
						$("#lname").val("");
						$("#email1").val("");
						
					} else {
						alert('loi');
					}
				},
				error: function (jqXhr, textStatus, errorMessage) { // error callback 
			        
			    }
			});
		}
		
}

		