const init = function() {
  const accountName = document.getElementById('user_account_name');
  const accountNamePattern = /^[a-zA-Z0-9_]{1,}$/;
  let accountNameValue;
  const accountNameBorder = document.getElementById('account_name_border');
  const accountNameInvalidMark = document.querySelector('#account_name_border svg')
  const accountNameInvalidMsg = document.getElementById('account_name_invalid_message')

  const password = document.getElementById('user_password');
  const passwordPattern = /^[a-zA-Z0-9@!&-]{4,}$/;
  let passwordValue;
  const passwordBorder = document.getElementById('password_border');
  const passwordInvalidMark = document.querySelector('#password_border svg')
  const passwordInvalidMsg = document.getElementById('password_invalid_message')

  accountName.addEventListener('input', function() {
    accountNameValue = accountName.value;
    if (accountNamePattern.test(accountNameValue)) {
      accountNameBorder.classList.remove('ring-red-300');
      accountNameBorder.classList.remove('focus-within:ring-red-600');
      accountNameBorder.classList.add('ring-gray-300');
      accountNameBorder.classList.add('focus-within:ring-indigo-600');
      accountNameInvalidMark.classList.add('hidden');
      accountNameInvalidMsg.classList.add('hidden');
    } else {
      accountNameBorder.classList.remove('ring-gray-300');
      accountNameBorder.classList.remove('focus-within:ring-indigo-600');
      accountNameBorder.classList.add('ring-red-300');
      accountNameBorder.classList.add('focus-within:ring-red-600');
      accountNameInvalidMark.classList.remove('hidden');
      accountNameInvalidMsg.classList.remove('hidden');
    }
  });

  password.addEventListener('input', function() {
    passwordValue = password.value;
    if (passwordPattern.test(passwordValue)) {
      passwordBorder.classList.remove('ring-red-300');
      passwordBorder.classList.remove('focus-within:ring-red-600');
      passwordBorder.classList.add('ring-gray-300');
      passwordBorder.classList.add('focus-within:ring-indigo-600');
      passwordInvalidMark.classList.add('hidden');
      passwordInvalidMsg.classList.add('hidden');
    } else {
      passwordBorder.classList.remove('ring-gray-300');
      passwordBorder.classList.remove('focus-within:ring-indigo-600');
      passwordBorder.classList.add('ring-red-300');
      passwordBorder.classList.add('focus-within:ring-red-600');
      passwordInvalidMark.classList.remove('hidden');
      passwordInvalidMsg.classList.remove('hidden');
    }
  });
}
export default init;
