








<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
		
		
			<title>ServicePlus-Prod</title>
		
	
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="icon" href="view-resources/image/serviceplus-logo.png" type="image/x-icon" />
 <link rel="stylesheet" href="/view-resources/components/bootstrap-5.2.0-dist/css/bootstrap.min.css">
 <link rel="stylesheet" href="/view-resources/components/bootstrap/css/bootstrapValidator.min.css">
 <link rel="stylesheet" href="/view-resources/components/bootstrap/css/bootstrap-datetimepicker.min.css">
 <link rel="stylesheet" href="/view-resources/components/select2/select2.min.css">
 <link rel="stylesheet" href="/view-resources/components/datatables/dataTables.bootstrap.css">
 <link rel="stylesheet" href="/view-resources/components/fontawesome-free-6.1.1-web/css/all.min.css">
 <link rel="stylesheet" href="/view-resources/themes/skins/_all-skins.min.css">
 <link rel="stylesheet" href="/resources/Menu/common/css/dashboard.min.css"></link>
 
 <link rel="stylesheet" href="/view-resources/css/mainStyle.css">
 <link rel="stylesheet" href="/view-resources/css/iconStyle.css">
<script  type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/view-resources/components/jQuery/jquery.validate.min.js"></script>
<script type="text/javascript" language="javascript" src="/view-resources/components/jQueryUI/jquery.blockUI.js"></script>
<script type="text/javascript" src="/view-resources/js/md5.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- <script>$.widget.bridge('uibutton', $.ui.button);</script> -->
<script type="text/javascript" src="/view-resources/components/bootstrap-5.2.0-dist/js/bootstrap.bundle.min.js"></script>
<script  type="text/javascript" src="/view-resources/components/jQueryUI/jquery-ui.min.js"></script>
<script type="text/javascript" src="/view-resources/components/bootstrap/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="/view-resources/themes/js/app.min.js"></script>
 <script type="text/javascript" src="/view-resources/themes/js/adminlte.min.js"></script> 
 
<script type="text/javascript" src="/view-resources/js/bootstrap-notify.min.js"></script>
<script type="text/javascript" src="/view-resources/js/jquery.slimscroll.min.js"></script>

<script type="text/javascript" src="/view-resources/js/bootbox.min.js"></script>
<script type="text/javascript" src="/view-resources/components/select2/select2.full.min.js"></script>
<script type="text/javascript" src="/view-resources/components/iCheck/icheck.min.js"></script>

<script type="text/javascript" charset="utf-8">
function formPost(completeURL){
	formPostCommon('N','','',completeURL)
}

function formPostPopup(type, widthHeight, trgt,completeURL){
	formPostCommon(type, widthHeight, trgt,completeURL)
}

function formPostIframe(type, trgt,completeURL){
	formPostCommon(type, '', trgt,completeURL)
}

// type(N=normal, P=popup, I=Iframe) with page title in-case of popup and iframe | sample:  P~Citizen Registration, I~Citizen Registration
// widthHeight: in-case of popup: sample 960~600 or blank ''
// trgt: not implemented: send blank ''
// completeURL: sample: applySerivce.do?serviceId=4444&locId=5555
function formPostCommon(type, widthHeight, trgt,completeURL){
	if(completeURL!='' && completeURL!=undefined && type!=undefined && widthHeight!=undefined && trgt!=undefined) {
		var formOpenType = "N";//
		var pageTitle = "Service Plus";
		var width  = 960;
		var height = 600;
		
		var iframeId = "iframeId";
	
		var fromTrgt = "_self";
		
		if(trgt!='' && trgt!=undefined) {
			fromTrgt = trgt.trim();
		}
	    
		if(type!='' && type!=undefined) {
			var typeSplit = type.split("~");
			formOpenType = typeSplit[0].trim();
			if(typeSplit.length>1) {
				pageTitle = typeSplit[1].trim();
			}
			if(typeSplit.length>2) {
				iframeId = typeSplit[2].trim();
			}
		}
		
		if(widthHeight!='' && widthHeight!=undefined) {
			var widthHeightSplit = widthHeight.split("~");
			width = parseInt(widthHeightSplit[0].trim());
			if(widthHeightSplit.length>1) {
				height = parseInt(widthHeightSplit[1].trim());
			}
		}
		
		var left = (window.screen.width / 2) - ((width / 2) + 10);
	    var top = (window.screen.height / 2) - ((height / 2) + 50);
		var pageName = pageTitle.replace(/ /g,'');
		
		var completeURLSplit = completeURL.split("?");
		var formURL = completeURLSplit[0];
		
		if(formOpenType=='N' || formOpenType=='n' || formOpenType=='P' || formOpenType=='p') {
			
			var formTag=document.createElement("form");
			formTag.method="POST";
			formTag.action=formURL;
			formTag.name=pageName;
			formTag.id=pageName;
			formTag.target = fromTrgt;
			
			if(completeURLSplit.length>1) {
				var params = completeURLSplit[1].split("&");
				for(var i=0; i<params.length; i++) {
					
						var paramSplit = params[i].split("=");
						var input = document.createElement("input");
						input.setAttribute("type", "hidden");
						input.setAttribute("name", paramSplit[0].trim());
						input.setAttribute("value", paramSplit[1].trim());
						formTag.appendChild(input);
						  
				}
				if(completeURL.indexOf("OWASP_CSRFTOKEN")==-1) {
				var input = document.createElement("input");
			    input.setAttribute("type", "hidden");
			    input.setAttribute("name", "OWASP_CSRFTOKEN");
			    input.setAttribute("value", "ITKC-MZEK-HG7D-U218-KG5A-9VFH-I8B9-1I64");
			    formTag.appendChild(input);
				}
			}
			
		  
		    
		 	if(formOpenType=='P' || formOpenType=='p') {
		 		formTag.target = pageName;
		 		window.open('',pageName,
			    	    "status=no,height=" + height + ",width=" + width + ",resizable=yes,left="
			    	    + left + ",top=" + top + ",screenX=" + left + ",screenY="
			    	    + top + ",toolbar=no,menubar=no,scrollbars=yes,location=no,directories=no");
		 	}
		 	
		 	if(fromTrgt.indexOf("parent")>-1) {
		 		window.opener.document.body.appendChild(formTag);
		 	} else {
		 		document.body.appendChild(formTag);
		 	}
		 	
			formTag.submit();
			$("#"+pageName).remove();
		} else if(formOpenType=='I' || formOpenType=='i') {
			var postParam = {};
			if(completeURLSplit.length>1) {
				var params = completeURLSplit[1].split("&");
				for(var i=0; i<params.length; i++) {
					var paramSplit = params[i].split("=");
					postParam [paramSplit[0].trim()] = paramSplit[1].trim();
				}
			}

			$.post(formURL, postParam, function(data){
				   var frame = document.getElementById(iframeId);
		           frame.contentWindow.document.open();
		           frame.contentWindow.document.write(data);
		           frame.contentWindow.document.close();
			});
		} else {
			alert('Invalid Request Type!');
		}
	} else {
		alert('Invalid Request!');
	}
}
</script>
</head>
<body>
			<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">









<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Error Page !!... </title>
 





<!--  Java Script and CSS Style Begin-->
<link rel="stylesheet" type="text/css" href="/resources/css/panchayat_main.css"/>
<link rel="stylesheet" type="text/css" href="/resources/css/jquery-ui.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/jquery.alerts.css" />
<link rel="stylesheet" type="text/css" href="/resources/css/helpMessage.css" />

<script type="text/javascript" src="/resources/js/jquery-1.6.2.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.validate.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery.alerts.js"></script>
<script type="text/javascript" src="/resources/js/jquery-ui-timepicker-addon.js"></script>
<script src="resources/js/helpMessage.js" type="text/javascript" language="javascript"></script>

<script type="text/javascript">
	window.history.forward();
	if (!navigator.onLine) {		
		 
		window.location.href = "logOutAction.html"; 

		} 
	
</script>











<link href="/resources/css_theme/panchayat_main.css" rel="stylesheet" type="text/css" />
<link href="/resources/css_theme/panchayat_green.css" rel="alternate stylesheet" type="text/css" media="screen" title="green-theme" />
<link href="/resources/css_theme/panchayat_peach.css" rel="alternate stylesheet" type="text/css" media="screen" title="peach-theme" />
<link href="/resources/css_theme/panchayat_blue.css" rel="alternate stylesheet" type="text/css" media="screen" title="blue-theme" />
<link href="/resources/css_theme/panchayat_new_theme.css" rel="alternate stylesheet" type="text/css" media="screen" title="new-theme" />
<script type="text/javascript" src="/resources/js_files/styleswitch.js"></script>
<script type="text/javascript" src="/resources/js_files/doctextsizer.js"></script>
<script type="text/javascript" src="/resources/js_files/jquery.min.js"></script>
<script type="text/javascript" src="/resources/js_files/ddaccordion.js"></script>
<script type="text/javascript" src="/resources/js_files/ddaccordion_action.js"></script>
<script type="text/javascript" src="/resources/js_files/collapse_pnl.js"></script>
<script type="text/javascript" src="/resources/js_files/animatedcollapse.js"></script>
<script type="text/javascript" src="/resources/js_files/contentscroller.js"></script>


<style>
/* css for timepicker */
.ui-timepicker-div .ui-widget-header{ margin-bottom: 8px; }
.ui-timepicker-div dl{ text-align: left; }
.ui-timepicker-div dl dt{ height: 25px; }
.ui-timepicker-div dl dd{ margin: -25px 0 10px 65px; }
.ui-timepicker-div td { font-size: 90%; }
</style>
<!--  Java Script and CSS Style End-->
		<script src="../../resources/js/Main.js"></script>
		<link rel="stylesheet"
	href="/view-resources/components/bootstrap-5.2.0-dist/css/bootstrap.min.css"/>

<link rel="stylesheet"
	href="/view-resources/components/fontawesome-free-6.1.1-web/css/all.min.css"/>
<link rel="stylesheet"
	href="/view-resources/css/mainStyle.css"/>


<script type="text/javascript"
	src="/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript"
	src="/view-resources/components/bootstrap-5.2.0-dist/js/bootstrap.bundle.min.js"></script>
</head>

<body>
<script>
  var excludeTabError = true;
</script>
<section class="content">
<div class="container-fluid">
	<div class="row">
		<section class="col-lg-12 connectedSortable">
		<div class="card" >
			<div class="card-header with-border" style="margin-bottom: 0%;">
				<h3 class="card-title">
				Following exception occurred while displaying/processing this webpage.</h3>
			</div>
			<div class="card-body">
				<div id="frmcontent">
				<table class="table table-bordered table-striped dataTable" id="serviceList">
					<tbody><tr>
						<th align="center">Info</th>
						<th align="center">Value</th>
					</tr>
					<tr>
						<td>Error Code</td>
						<td>5069834</td>
					</tr>
					<tr>
						<td>Annotation</td>
						<td>loginWindow.do</td>
					</tr>
					<tr>
						<td>Date</td>
						<td>Fri Dec 22 19:25:44 IST 2023</td>
					</tr>

				</tbody></table>
				
				</div>
				</div>
				
				
		</div>
		</section>
	</div></div>
	</section>


</body>
</html>	
 </body>
</html>