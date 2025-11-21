// Simple cookie consent banner. Stores consent in localStorage under 'mk_cookie_consent'
(function () {
  const key = 'mk_cookie_consent';
  if (typeof window === 'undefined') return;
  if (localStorage.getItem(key) === 'accepted') return;

  function createBanner() {
    const div = document.createElement('div');
    div.className = 'cookie-banner';
    div.innerHTML = `
      <div class="cookie-banner__content">
        <p>We use cookies to improve your experience. By continuing you accept our <a href="privacy.html">Privacy Policy</a>.</p>
        <div class="cookie-banner__actions">
          <button class="cookie-accept">Accept</button>
        </div>
      </div>`;
    document.body.appendChild(div);
    div.querySelector('.cookie-accept').addEventListener('click', function () {
      localStorage.setItem(key, 'accepted');
      div.style.display = 'none';
    });
  }

  // Wait for DOM ready
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', createBanner);
  } else {
    createBanner();
  }
})();
