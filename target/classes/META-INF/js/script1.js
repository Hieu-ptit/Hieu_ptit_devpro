var Sp = [
{
   'stt':'1',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN  ',
   'gia':'22.990.000 VND',
   'khuyenmai':'10%'
},
{
   'stt':'2',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN',
   'gia':'22.990.000 VND',
   'khuyenmai':'20%'
},
{
   'stt':'3',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'30%'
},
{
   'stt':'4',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'40%'
},
{
   'stt':'5',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'50%'
},
{
   'stt':'6',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'60%'
},
{
   'stt':'7',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'70%'
},
{
   'stt':'8',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'80%'
},
{
   'stt':'9',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'90%'
},
{
   'stt':'10',
   'ten':'Laptop Lenovo Ideapad S145 14IIL 81W600AQVN ',
   'gia':'22.990.000 VND',
   'khuyenmai':'20%'
},
];
var editmode = false;
var temp;
document.addEventListener('DOMContentLoaded',function(){
    // alert('helo');
    renderSanPham();
});
function enableMode(){
  editmode = true;
}
function disenable(){
  editmode = false;
}


function renderSanPham(){
  var html = ''
  for(var i = 0; i < Sp.length;i++){
    var sp = Sp[i];
    html +=  '<tr>';
    html +=    '<th scope="row">'+sp.stt+'</th>';
    html +=    '<td>' + sp.ten+'</td>';
    html +=    '<td>' + sp.gia+'</td>';
    html +=    '<td>'+sp.khuyenmai+'</td>';
    html +=    '<td><i class="sp-delete" onclick = "onDeleteSP('+i+')">X</i></td>'
    html +=    '<td><i class="sp-edit" onclick = "onEdit('+i+')">EDIT</i></td>'
    html +=   '</tr>';
}
      setHTML('#sanpham-list',html);
}
function onEdit(index){
  temp = index;
    var sp1 = getSanPham(index);
    setInputValue('.sanpham-form .stt',sp1.stt);
    setInputValue('.sanpham-form .ten',sp1.ten);
    setInputValue('.sanpham-form .gia',sp1.gia);
    setInputValue('.sanpham-form .khuyenmai',sp1.khuyenmai);
    enableMode();
    setHTML('.createsp','UPDATE');
}
function getSanPham(index){
    return Sp[index];
}
function setHTML(selector,html){
  var element = document.querySelector(selector);
  element.innerHTML = html;
}
function setInputValue(selector,value){
  var element = document.querySelector(selector);
  element.value = value;
}
function onDeleteSP(index){
  if(confirm('Bạn có chắc muốn xóa???' ))
      deleteSp(index);
      renderSanPham();
}
function deleteSp(index){
      Sp.splice(index,1);
}
function getInputValue(selector){
  var inputElement = document.querySelector(selector);
  return inputElement.value;
}
function editSpHandle(){
   var stt = getInputValue('.sanpham-form .stt');
   var ten = getInputValue('.sanpham-form .ten');
   var gia = getInputValue('.sanpham-form .gia');
   var khuyenmai = getInputValue('.sanpham-form .khuyenmai');
   console.log({
    stt,
    ten,
    gia,
    khuyenmai
   });
   Sp[temp] = {
    stt,
    ten,
    gia,
    khuyenmai
   }
   renderSanPham();
   disenable();
   setHTML('.createsp','Create')
   resetForm();
}
function resetForm(){
  setInputValue('.sanpham-form .stt','');
    setInputValue('.sanpham-form .ten','');
    setInputValue('.sanpham-form .gia','');
    setInputValue('.sanpham-form .khuyenmai','');
}
function onClickCreateSanPham(){
  if(editmode){
      editSpHandle();
  }else{
        var stt = getInputValue('.sanpham-form .stt');
      var ten = getInputValue('.sanpham-form .ten');
      var gia = getInputValue('.sanpham-form .gia');
      var khuyenmai = getInputValue('.sanpham-form .khuyenmai');


      addSp({
        stt:stt,
        ten:ten,
        gia:gia,
        khuyenmai:khuyenmai
    });
    renderSanPham();
    resetForm();
}
}
function addSp(sanpham){
    Sp.push(sanpham);
}




