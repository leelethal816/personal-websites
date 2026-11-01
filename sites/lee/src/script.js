(() => {
  const toggle = document.querySelector(".theme-toggle");
  const label = toggle?.querySelector(".theme-label");

  function applyTheme(theme) {
    document.body.dataset.theme = theme;
    const dark = theme === "dark";
    toggle?.setAttribute("aria-pressed", String(!dark));
    toggle?.setAttribute("aria-label", `Switch to ${dark ? "light" : "dark"} theme`);
    if (label) label.textContent = dark ? "Light" : "Dark";
  }

  let theme = "dark";
  try {
    const savedTheme = localStorage.getItem("theme");
    if (savedTheme === "light" || savedTheme === "dark") theme = savedTheme;
  } catch {
    // The toggle remains usable when browser storage is unavailable.
  }
  applyTheme(theme);
  if (toggle) toggle.hidden = false;

  toggle?.addEventListener("click", () => {
    const nextTheme = document.body.dataset.theme === "dark" ? "light" : "dark";
    applyTheme(nextTheme);
    try {
      localStorage.setItem("theme", nextTheme);
    } catch {
      // Keep the selected theme for this visit even if it cannot be saved.
    }
  });
})();
