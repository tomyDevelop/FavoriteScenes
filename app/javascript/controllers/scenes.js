// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
const init = function() {
  const hoursList = document.getElementById('hoursList');
  const minutesList = document.getElementById('minutesList');
  const secondsList = document.getElementById('secondsList');

  const hoursComboToggle = function () {
    if (hoursList.classList.contains('hidden')) {
      hoursList.classList.remove('hidden');
    } else {
      hoursList.classList.add('hidden');
    }
  }

  const minutesComboToggle = function () {
    if (minutesList.classList.contains('hidden')) {
      minutesList.classList.remove('hidden');
    } else {
      minutesList.classList.add('hidden');
    }
  }

  const secondsComboToggle = function () {
    if (secondsList.classList.contains('hidden')) {
      secondsList.classList.remove('hidden');
    } else {
      secondsList.classList.add('hidden');
    }
  }

  const hours = document.getElementById('hours');
  const minutes = document.getElementById('minutes');
  const seconds = document.getElementById('seconds');
  hours.addEventListener('click', hoursComboToggle);
  minutes.addEventListener('click', minutesComboToggle);
  seconds.addEventListener('click', secondsComboToggle);

  const hourCombobox = document.getElementById('combobox_hours');
  const hours_options = document.querySelectorAll('#hoursList li');
  const minuteCombobox = document.getElementById('combobox_minutes');
  const minutes_options = document.querySelectorAll('#minutesList li');
  const secondCombobox = document.getElementById('combobox_seconds');
  const seconds_options = document.querySelectorAll('#secondsList li');

  const hoursSelectOption = function(e) {
    hourCombobox.value = e.target.textContent;
  }

  const minutesSelectOption = function(e) {
    minuteCombobox.value = e.target.textContent;
  }

  const secondsSelectOption = function(e) {
    secondCombobox.value = e.target.textContent;
  }

  const sceneSeconds = document.getElementById('scene_seconds');
  let hoursValue;
  let minutesValue;
  let secondsValue;
  const convertSeconds = function() {
    hoursValue = Number(hourCombobox.value);
    minutesValue = Number(minuteCombobox.value);
    secondsValue = Number(secondCombobox.value);

    sceneSeconds.value = hoursValue*3600 + minutesValue*60 + secondsValue;
  }

  hours_options.forEach( function(option) {
    option.addEventListener('click', function(e) {
      hoursSelectOption(e);
      hoursComboToggle();
      convertSeconds();
    });
  });

  minutes_options.forEach( function(option) {
    option.addEventListener('click', function(e) {
      minutesSelectOption(e);
      minutesComboToggle();
      convertSeconds();
    });
  });

  seconds_options.forEach( function(option) {
    option.addEventListener('click', function(e) {
      secondsSelectOption(e);
      secondsComboToggle();
      convertSeconds();
    });
  });

  hourCombobox.addEventListener('input', function() {
    convertSeconds();
  });

  minuteCombobox.addEventListener('input', function() {
    convertSeconds();
  });

  secondCombobox.addEventListener('input', function() {
    convertSeconds();
  });

  document.addEventListener('mousedown', function(e) {
    if (!hourCombobox.contains(e.target) && !hours.contains(e.target) && !hoursList.contains(e.target)) {
      if (!hoursList.classList.contains('hidden')) {
        hoursList.classList.add('hidden');
      }
    }
  });

  document.addEventListener('mousedown', function(e) {
    if (!minuteCombobox.contains(e.target) && !minutes.contains(e.target) && !minutesList.contains(e.target)) {
      if (!minutesList.classList.contains('hidden')) {
        minutesList.classList.add('hidden');
      }
    }
  });

  document.addEventListener('mousedown', function(e) {
    if (!secondCombobox.contains(e.target) && !seconds.contains(e.target) && !secondsList.contains(e.target)) {
      if (!secondsList.classList.contains('hidden')) {
        secondsList.classList.add('hidden');
      }
    }
  });

  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      if (!hoursList.classList.contains('hidden')) {
        hoursList.classList.add('hidden');
      }
    }
  });

  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      if (!minutesList.classList.contains('hidden')) {
        minutesList.classList.add('hidden');
      }
    }
  });

  document.addEventListener('keydown', function(e) {
    if (e.key === 'Escape') {
      if (!secondsList.classList.contains('hidden')) {
        secondsList.classList.add('hidden');
      }
    }
  });
}

export default init;
