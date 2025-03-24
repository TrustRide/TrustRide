<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <script src="https://cdn.iamport.kr/v1/iamport.js"></script>
</head>

<body>

<script>
  $(function(){
    var IMP = window.IMP;
    IMP.init('import');
    IMP.request_pay({
      pg : 'html5_inicis',
      pay_method : 'card', //카드결제
      merchant_uid : 'merchant_' + new Date().getTime(),
      name : `${cardPaymentDTO.productName}`,
      amount : `${cardPaymentDTO.orderAmount}`, //판매가격
      buyer_email : 'hong@naver.com',
      buyer_name : `${cardPaymentDTO.userId}`,
      buyer_tel : '010-1234-5678',
      buyer_addr : '인천시',
    }, function(rsp) {
      if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;

        pay_info(rsp);

      } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;

        location.href="/gearshift/payment/select";
      }
    });

    function pay_info(rsp){
      var form = document.createElement('form');
      var objs;

      // 상품명
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'productName');
      objs.setAttribute('value', rsp.name);
      form.appendChild(objs);

      // 결제수단
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'paymentMethod');
      objs.setAttribute('value', "신용카드");
      form.appendChild(objs);


      // 구매자명
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'userId');
      objs.setAttribute('value', rsp.buyer_name);
      form.appendChild(objs);

      // 결제금액
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'orderAmount');
      objs.setAttribute('value', rsp.paid_amount);
      form.appendChild(objs);

      // 할인금액
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'discountAmount');
      objs.setAttribute('value', `${cardPaymentDTO.discountAmount}`);
      form.appendChild(objs);

      // 최종 금액
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'totalAmount');
      objs.setAttribute('value', `${cardPaymentDTO.totalAmount}`);
      form.appendChild(objs);

      // 소유 형태
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'ownershipType');
      objs.setAttribute('value', `${cardPaymentDTO.ownershipType}`);
      form.appendChild(objs);

      // 공동명의 여부
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'isJointOwnership');
      objs.setAttribute('value', ${cardPaymentDTO.isJointOwnership});
      form.appendChild(objs);

      // 배송 기사 전화번호
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'driverPhoneNumber');
      objs.setAttribute('value', `${cardPaymentDTO.driverPhoneNumber}`);
      form.appendChild(objs);

      // 배송요청 사항
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'deliveryRequest');
      objs.setAttribute('value', `${cardPaymentDTO.deliveryRequest}`);
      form.appendChild(objs);

      // 희망배송일
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'preferredDate');
      objs.setAttribute('value', `${cardPaymentDTO.preferredDate}`);
      form.appendChild(objs);

      // 배송 기사 이름
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'deliveryDriverName');
      objs.setAttribute('value', `${cardPaymentDTO.deliveryDriverName}`);
      form.appendChild(objs);

      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'deliveryFee');
      objs.setAttribute('value', `${cardPaymentDTO.deliveryFee}`);
      form.appendChild(objs);

      form.setAttribute('method', 'post');
      form.setAttribute('action', "/gearshift/orders/status/credit");
      document.body.appendChild(form);
      form.submit();
    }

  });
</script>

</body>
</html>

