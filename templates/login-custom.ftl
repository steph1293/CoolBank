<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <link rel="stylesheet" href="${url.resourcesPath}/css/login-custom.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <style>
    .toggle-password img {
      width: 20px;
      /* Ajusta el tamaño según tus preferencias */
      height: auto;
      /* Para mantener la proporción original */
    }
  </style>
  <title>Login</title>
</head>

<body>
  <div class="container-login">
    <div class="header-login">
      <img id="logoBppr_img" src="${url.resourcesPath}/img/CoolBank.svg" alt="Logo" />
      <div class="frame-login">
        <span id="logInCoolBank_lbl">Log in to Mi Banco</span>
        <span id="yourDetails_lbl">Please enter your details.</span>
      </div>
    </div>
    <form class="form-container" action="${url.loginAction}" method="post">
      <div class="username-container">
        <div class="username-input-container">
          <label class="username-label" for="username_txt">Username</label>
          <input class="username-input  <#if error??>error-outline</#if>" type="text" id="username_txt" name="username"
            placeholder="Enter your username" required />
        </div>
        <div class="username-checkbox-container">
          <label id="title" class="username-checkbox-label" for="rememberUser_chk">Remember Username</label>
          <input class="username-checkbox" type="checkbox" disabled onclick="updateUI()" id="rememberUser_chk" />
        </div>
      </div>
      <div class="password-container">
        <div class="password-input-container">
          <label class="password-label" for="password_txt">Password</label>
          <input type="password" id="password_txt" class="password-input <#if error??>error-outline</#if>" name="password"
            placeholder="Enter your password" required />
          <i class="toggle-password" id="viewIcon_img" style="color: gray; display: none; cursor: pointer;"
            onclick="showTogglePasswordIcon()">
            <img src="${url.resourcesPath}/img/showPasswordIcon.png" alt="Show password" />
          </i>
          <i class="toggle-password" id="hideIcon_img" style="color: gray; display: none; cursor: pointer;"
            onclick="showTogglePasswordIcon()">
            <img src="${url.resourcesPath}/img/hidePasswordIcon.png" alt="Hide password" />
          </i>
        </div>
      </div>
      <div class="error" id="InvalidMessage_LBL">
        <#if error??>${error}</#if>
      </div>
      <div class="submit-container">
        <button class="submit-button disabled-button" id="continue_btn" type="submit" disabled>
          Continue
        </button>
        <a href="#" class="forgot-link">Forgot username or password?</a>
      </div>
    </form>
  </div>
</body>
<script>

  function updateUI() {
    let userNametextInput = document.getElementById('username_txt').value;
    let rememberUserChkInput = document.getElementById('rememberUser_chk');
    let titleElement = document.getElementById('title');

    if (userNametextInput !== '') {
      rememberUserChkInput.disabled = false;
      titleElement.style.color = 'gray'
      rememberUserChkInput.style.background = 'black';
      rememberUserChkInput.style.borderColor = 'gray'

      if (rememberUserChkInput.checked) {
        titleElement.style.color = 'black';
        rememberUserChkInput.style.background = 'black';
      }
      else {
        rememberUserChkInput.style.margin = '0';
        rememberUserChkInput.style.background = 'white';
      }

    } else {
      rememberUserChkInput.disabled = true;
      rememberUserChkInput.checked = false;
      titleElement.style.color = 'gray';
      rememberUserChkInput.style.backgroundColor = 'white';
      rememberUserChkInput.style.borderColor = 'gray'

    }
  }

  function toggleButtonStateOnInput(input) {
    let usernameInput = document.getElementById("username_txt").value;
    let passwordInput = document.getElementById("password_txt").value;
    let continue_btn = document.getElementById("continue_btn");

    if (usernameInput.length > 0 && passwordInput.length > 0) {
      continue_btn.classList.remove("disabled-button");
      continue_btn.disabled = false;
    } else {
      continue_btn.classList.add("disabled-button");
      continue_btn.disabled = true;
    }
  }

  function clearError() {
    let errorContainer = document.getElementById("InvalidMessage_LBL");
    errorContainer.innerHTML = "";
    document.getElementById("password_txt").classList.remove("error-outline");
    document.getElementById("username_txt").classList.remove("error-outline");
  }

  function sanitizeInput() {
    document.getElementById("username_txt").value = document.getElementById("username_txt").value.replace(/[^a-z0-9]/gi, '');
  }

  function isNoSpacesInput(input) {
    let regex = /^\S*$/;
    return regex.test(input);
  }

  function isAlphanumericInput(input) {
    let regex = /^[a-zA-Z0-9]*$/;
    return regex.test(input);
  }

  // Event Listeners
  document
    .getElementById("continue_btn")
    .addEventListener("click", function (event) {
      // Prevents the form from being submitted whitout input validation
      event.preventDefault();

      let button = this;

      let passwordInput = document.getElementById("password_txt");
      let usernameInput = document.getElementById("username_txt")

      if (!isNoSpacesInput(passwordInput.value) || !isAlphanumericInput(usernameInput.value)) {
        // Add error message
        errorContainer = document.getElementById("InvalidMessage_LBL");
        errorContainer.innerHTML = "Username or password does not match. Please try again.";

        // Add error classes to the input boxes
        passwordInput.classList.add("error-outline");
        usernameInput.classList.add("error-outline");

        return;
      }


      button.innerHTML= `<div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>`;
      
      button.classList.add("submit-button-active");
        
      setTimeout( () => {
          this.form.submit();
      }, 2000);
    });

  document.getElementById('username_txt').addEventListener('keydown', function (event) {
    if (!isAlphanumericInput(event.key)) {
      event.preventDefault();
    }
  });


  document
    .getElementById("username_txt")
    .addEventListener("input", () => {
      toggleButtonStateOnInput();
      clearError();
      sanitizeInput();
      updateUI();
    });
  document
    .getElementById("password_txt")
    .addEventListener("input", () => {
      toggleButtonStateOnInput();
      clearError();
    });
</script>

<script src="${url.resourcesPath}/js/togglePasswordIcon.js"></script>

</html>
