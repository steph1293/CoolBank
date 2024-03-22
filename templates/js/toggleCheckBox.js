function updateUI() {
    let userNametextInput = document.getElementById('username_txt').value;
    let rememberUserChkInput = document.getElementById('rememberUser_chk');
    let titleElement = document.getElementById('title');
  
    

    if (rememberUserChkInput.disabled = userNametextInput.value !=='') {
      rememberUserChkInput.disabled = false;
      titleElement.style.color = 'grey';  // Might be a typo
      rememberUserChkInput.style.background = 'black';
      rememberUserChkInput.style.borderColor = 'gray';
  
      if (rememberUserChkInput.checked) {
        titleElement.style.color = 'black';
      }
      rememberUserChkInput.style.background = rememberUserChkInput.checked ? 'black' : 'white'; // Use ternary operator for conciseness
    } else {
      rememberUserChkInput.disabled = true;
      rememberUserChkInput.checked = false;
      titleElement.style.color = 'gray';
      rememberUserChkInput.style.background = 'white';
      rememberUserChkInput.style.borderColor = 'gray';
    }
  }
  function toggleButtonStateOnInput(input) {
    let usernameInput = document.getElementById("username_txt").value;
    let passwordInput = document.getElementById("password_txt").value;
    let continue_btn = document.getElementById("continue_btn");

    if (usernameInput.length > 0 && passwordInput.length > 0) {
      continue_btn.classList.remove("disabled-button");
      continue_btn.classList.add("submit-button");
      continue_btn.disabled = false;
    } else {
      continue_btn.classList.add("disabled-button");
      continue_btn.disabled = true;
    }
  }