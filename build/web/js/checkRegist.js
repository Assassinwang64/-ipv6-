function init(){
    document.reg_form.user_name.focus();
}
function Verify(){
    if(VerifyPassword()==false)return false;
//if(VerifyTel_number()==false)return false;
//if(VerifyPostalcode()==false)return false;
    alert("Register completed!");
    return true;
}
function VerifyPassword(){
    if(document.reg_form.user_password.value!=document.reg_form.user_password_re.value)
    {
        alert("Password mismatch!");
        return false;
    }
    return true;
}
function VerifyTel_number(){
//alert(document.reg_form.telephone.length());
    if(document.reg_form.telephone.value.length!=0||document.reg_form.telephone.value.length!=9||document.reg_form.telephone.value.length!=11)
    {
        alert("电话号码为9或11位，请重新输入！");
        return false;
    }
    return true;
}
function VerifyPostalcode(){
    if(document.reg_form.postalcode.value.length!=6||document.reg_form.postalcode.value.length!=0)
    {
        alert("邮编为6位数，请重新输入！");
        return false;
    }
    return true;
}