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
      merchant_uid : 'merchant_' + new Date().getTime(),  //주문번호
      name : `${paymentDTO.modelName}`,                   //상품이름
      amount : `${paymentDTO.carAmountPrice}`,               // 총 결제 금액
      buyer_email : 'hong@naver.com',                     // 구매자 이메일
      buyer_name : '홍길동',                                   // 구매자 이름
      buyer_tel : '010-1234-5678',                        // 구매자 전화번호
      buyer_addr : '인천시',                               // 구매자 주소
    }, function(rsp) {
      if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;                // 결제 고유번호
        msg += '상점 거래ID : ' + rsp.merchant_uid;      // 주문번호
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

      // 구매자명
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_name');
      objs.setAttribute('value', rsp.buyer_name);
      form.appendChild(objs);

      // 구매자 전화번호
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_phone');
      objs.setAttribute('value', rsp.buyer_tel);
      form.appendChild(objs);

      // 구매자 이메일
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'member_email');
      objs.setAttribute('value', rsp.buyer_email);
      form.appendChild(objs);

      // 구매자 주소
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buy_addr');
      objs.setAttribute('value', rsp.buyer_addr);
      form.appendChild(objs);

      // 결제 고유번호
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_buyid');
      objs.setAttribute('value', rsp.imp_uid);
      form.appendChild(objs);


      // 결제금액
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'amount');
      objs.setAttribute('value', rsp.paid_amount);
      form.appendChild(objs);

      // 카드 승인번호
      objs = document.createElement('input');
      objs.setAttribute('type', 'hidden');
      objs.setAttribute('name', 'buyer_card_num');
      objs.setAttribute('value', rsp.apply_num);
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

