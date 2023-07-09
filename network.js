var communication = document.querySelector(".speech");
var chat = document.querySelector('.Mouth');
var spaces = document.querySelector('.space');
network = document.querySelector('#call');

network.addEventListener("click", () => {
  spaces.classList.toggle('space');
});

network.addEventListener("click", () => {
  communication.classList.toggle('speech');
});

network.addEventListener("click", () => {
  chat.classList.toggle('Mouth');
});
