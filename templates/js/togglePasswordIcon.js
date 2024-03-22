var passwordInput = document.getElementById("password_txt");
var showIcon = document.getElementById("viewIcon_img");
var hideIcon = document.getElementById("hideIcon_img");
var lastCharTimeout;
var hiddenPassword;

passwordInput.addEventListener('input', function (e) {
  showIcon.style.display = 'none';
  hideIcon.style.display = 'none';

  if (e.inputType === 'insertText' || e.inputType === 'insertFromPaste') {
    if (passwordInput.value.length > 0) {
      showIcon.style.display = 'block';
      showLastCharTemporarily();
    } else {
      passwordInput.type = "password";
      hiddenPassword = null;
    }
  } else if (e.inputType === 'deleteContentBackward') {
    hiddenPassword = comparePassword(hiddenPassword);
    if (hiddenPassword != null && hiddenPassword.length > 0) {
      showIcon.style.display = 'block';
    }
  }
});

function showLastCharTemporarily() {
  clearTimeout(lastCharTimeout);

  hiddenPassword = comparePassword(hiddenPassword);
  var lastChar = passwordInput.value.charAt(passwordInput.value.length - 1);
  passwordInput.value = '•'.repeat(passwordInput.value.length - 1) + lastChar;
  passwordInput.type ='text';

  lastCharTimeout = setTimeout(function () {
    passwordInput.type = "password";
    passwordInput.value= hiddenPassword;
  }, 1000);
}

function comparePassword(hiddenPassword){
  let inputPasswordLength =  passwordInput.value.length;
  let inputPasswordValue = passwordInput.value;
  let hiddenPasswordLength = hiddenPassword != null ? hiddenPassword.length : 0;

  if(hiddenPassword == null){
    hiddenPassword = inputPasswordValue;
  } else if(hiddenPasswordLength < inputPasswordLength) {
    hiddenPassword =  hiddenPassword + inputPasswordValue.charAt(inputPasswordLength - 1);
  } else if (hiddenPasswordLength > inputPasswordLength){
    let chars = hiddenPassword.slice(0,-1);
    hiddenPassword = chars !== '' ? chars : null;
  }

  return hiddenPassword;
}

function showTogglePasswordIcon() {
  if (passwordInput.type === "password") {
    passwordInput.type = "text";
    showIcon.style.display = 'none';
    hideIcon.style.display = 'block';
  } else {
    passwordInput.type = "password";
    showIcon.style.display = 'block';
    hideIcon.style.display = 'none';
  }
}

