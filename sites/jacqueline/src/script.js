const savedTheme = localStorage.getItem("theme");

if (savedTheme) {
  document.body.dataset.theme = savedTheme;
}

document.querySelector(".theme-toggle")?.addEventListener("click", () => {
  const nextTheme = document.body.dataset.theme === "dark" ? "light" : "dark";
  document.body.dataset.theme = nextTheme;
  localStorage.setItem("theme", nextTheme);
});
