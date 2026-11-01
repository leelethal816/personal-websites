(() => {
  const toggle = document.querySelector(".theme-toggle");
  const label = toggle?.querySelector(".theme-label");
  const icon = toggle?.querySelector(".theme-icon");

  function applyTheme(theme) {
    const evening = theme === "dark";
    document.body.dataset.theme = theme;
    toggle?.setAttribute("aria-pressed", String(evening));
    toggle?.setAttribute("aria-label", `Switch to ${evening ? "morning" : "evening"} theme`);
    if (label) label.textContent = evening ? "Morning" : "Evening";
    if (icon) icon.textContent = evening ? "☀" : "☾";
  }

  let theme = "light";
  try {
    const saved = localStorage.getItem("theme");
    if (saved === "light" || saved === "dark") theme = saved;
  } catch {
    // Theme switching still works when browser storage is unavailable.
  }
  applyTheme(theme);
  if (toggle) toggle.hidden = false;

  toggle?.addEventListener("click", () => {
    const next = document.body.dataset.theme === "dark" ? "light" : "dark";
    applyTheme(next);
    try {
      localStorage.setItem("theme", next);
    } catch {
      // Retain the selected palette for this visit.
    }
  });
})();
