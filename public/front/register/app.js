const inputs = document.querySelectorAll(".input-field");
const toggle_btn = document.querySelectorAll(".toggle");
const main = document.querySelector("main");
const bullets = document.querySelectorAll(".bullets span");
const images = document.querySelectorAll(".image");
const form = document.querySelector(".sign-up-form");
const phoneNumberInput = document.getElementById('phone-number');

inputs.forEach((inp) => {
    inp.addEventListener("focus", () => {
        inp.classList.add("active");
    });
    inp.addEventListener("blur", () => {
        if (inp.value != "") return;
        inp.classList.remove("active");
    });
});

toggle_btn.forEach((btn) => {
    btn.addEventListener("click", () => {
        main.classList.toggle("sign-up-mode");
    });
});

function moveSlider(index) {
    let currentImage = document.querySelector(`.img-${index}`);
    images.forEach((img) => img.classList.remove("show"));
    currentImage.classList.add("show");

    const textSlider = document.querySelector(".text-group");
    textSlider.style.transform = `translateY(${-(index - 1) * 2.2}rem)`;

    bullets.forEach((bull) => bull.classList.remove("active"));
    bullets[index - 1].classList.add("active");
}

let currentIndex = 1;
const totalSlides = bullets.length;

function autoMoveSlider() {
    currentIndex = (currentIndex % totalSlides) + 1;
    moveSlider(currentIndex);
}

bullets.forEach((bullet, index) => {
    bullet.addEventListener("click", () => {
        currentIndex = index + 1;
        moveSlider(currentIndex);
    });
});

setInterval(autoMoveSlider, 3000); // interval time as needed (maked it every 3 seconds)

form.addEventListener("submit", (e) => {
    e.preventDefault();
    window.location.href = `${form.action}/${phoneNumberInput.value}`;
});

phoneNumberInput.addEventListener('input', function () {
    if (this.value.length > 1 && this.value.startsWith('0')) {
        this.value = this.value.replace(/^0+/, '');
    }
});

document.getElementById('phone-number').addEventListener('input', function () {
    const phoneNumber = this.value;
    const errorMessage = document.getElementById('error-message');

    // Check if number 9 digits
    if (phoneNumber.length > 9) {
        // error message
        errorMessage.style.display = 'inline';
    } else {
        errorMessage.style.display = 'none';
    }
});
