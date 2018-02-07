$(function() {
  $('#main-title').on('click',function(){
    $('#content').show();
    $('#background').fadeOut(1200);
  })
  $('#loginTib').on('click',function(){
    $('#registerPad').attr('class','pad fadeIn animated');
  })
  $('#registerTib').on('click',function(){
    $('#loginPad').attr('class','pad fadeIn animated');
  })
  $('#login #loginPassword,#login #registerPassword,#login #retruePassword').focus(function(){
    $('#owl-login').addClass('password');
  }).blur(function() {
    $('#owl-login').removeClass('password');
  });
  $('#loginTib').on('click',function(){
    $('#loginPad').hide();
    $('#registerPad').show();
  })
  $('#registerTib').on('click',function(){
    $('#loginPad').show();
    $('#registerPad').hide();
  })
  $('#img_vercode').on('click',function(){
	  this.src="/TianTianTao/vercode?d="+Math.random();
  })
  $('#Main_loginBtn').on('click',function(){
    let name = $('#loginUser').val();
    let password = $('#loginPassword').val();
    let vercode = $('#vercode').val();
    $.post('./login',{name,password,vercode},function(data){
      if(data.code === 1){
        setTimeout(() => {
          $('#img_vercode').trigger('click');
          $('#vercode').val('').focus();
        },60)
        $('#verLoginTibs').text(data.state).fadeIn();
        setTimeout(() => {
          $('#verLoginTibs').fadeOut();
        },2400)
      } else if(data.code === 2 || data.code === 3) {
        $('#verLoginTibs').text(data.state).fadeIn();
        setTimeout(() => {
          $('#verLoginTibs').fadeOut();
        },2400)
      } else {
        location.reload("force");
      }
    })
  })
  $('#Main_registerBtn').on('click',function(){
    let name = $('#registerUser').val();
    let password = $('#registerPassword').val();
    let returePassword = $('#retruePassword').val();
    if(password != returePassword){
      $('#verRegisterTibs').text('两次输入的密码不同！').fadeIn();
      setTimeout(() => {
        $('#verRegisterTibs').fadeOut();
      },2400)
      return;
    };
    $.post('./register',{name,password},function(data){
      if(data.code !== 0){
        $('#verRegisterTibs').text(data.state).fadeIn();
        setTimeout(() => {
          $('#verRegisterTibs').fadeOut();
        },2400)
      } else{
        $('#Modal').modal('hide');
        $('#registerSuccessTib').text(data.state).attr('class','bounceIn animated alert alert-success').show();
        setTimeout(() => {
          $('#registerSuccessTib').fadeOut();
        },3000)
      }
    })
  })
  $('#MgModal').on('show.bs.modal',() => {
    $('#mgUsername').val('');
    $('#mgPassword').val('');
  })
  $('#cart').on('click',() => {
    location.href = './cart'
  })
  $('#personal').on('click',() => {
    location.href = './personal'
  })
});
function login(){
  $('#Modal').on('show.bs.modal', function(){
    $('#loginPad').show();
    $('#registerPad').hide();
    $('#loginUser').val('');
    $('#loginPassword').val('');
    $('#vercode').val('');
    $('#img_vercode').trigger('click');
    $('.lrmodel').attr('class', 'modal zoomIn animated');
  })
}
function register(){
  $('#Modal').on('show.bs.modal', function(){
    $('#loginPad').hide();
    $('#registerPad').show();
    $('#registerUser').val('');
    $('#registerPassword').val('');
    $('#retruePassword').val('');
    $('.lrmodel').attr('class', 'modal zoomIn animated');
  })
}
function logout(){
  location.href = './logout';
}
function manager(){
	location.href = './manager'
}
function mglogin(){
  let name = $('#mgUsername').val();
  let password = $('#mgPassword').val();
  $.post('./ismanager',{name,password}).then(data => {
    if(data.code === 1){
      $('#modal-title').html(`<span id="modal-title" class="modal-title lmfailInfo">${data.state}</span>`)
      setTimeout(() => {
        $('#modal-title').html(`<span id="modal-title" class="modal-title">前往我的小店</span>`);
      },2000)
    } else {
      location.href = './manager';
    }
  })
}
function searchSubmit(){
  let name = $('#search_input').val();
  location.href = './goodsQuery?name='+name;
}