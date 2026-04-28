<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false displayInfo=false; section>
  <#if section = "header">
    <span class="cello-hidden-header">CELLO</span>
  <#elseif section = "form">
    <div
      class="cello-login-card"
      id="cello-login-card"
      data-brand-theme-api="${(properties.brandThemeApiUrl)!'/terms-api/api/v1/public/brand-theme/settings'}"
    >
      <h1 class="cello-title">เข้าสู่ระบบ</h1>
      <p class="cello-subtitle">ยินดีต้อนรับเข้าสู่ระบบ เพื่อใช้งาน Cello Portal</p>

      <#if message?has_content>
        <div class="cello-alert cello-alert-${message.type}">${kcSanitize(message.summary)?no_esc}</div>
      </#if>

      <form id="kc-form-login" class="cello-form" action="${url.loginAction}" method="post">
        <div class="cello-field">
          <label for="username">ชื่อผู้ใช้ <span class="required">*</span></label>
          <div class="cello-input-wrap">
            <input tabindex="1" id="username" class="cello-input" name="username" type="text" autofocus autocomplete="username" value="${(login.username!'')}" placeholder="กรุณาระบุชื่อผู้ใช้ให้ถูกต้อง" />
            <button
              class="cello-password-toggle"
              id="cello-username-clear"
              type="button"
              aria-label="ลบชื่อผู้ใช้"
              style="display: none;"
            >
              <span class="cello-password-icon" aria-hidden="true">
                <svg viewBox="0 0 24 24" focusable="false">
                  <path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"/>
                </svg>
              </span>
            </button>
          </div>
        </div>

        <div class="cello-field">
          <label for="password">รหัสผ่าน <span class="required">*</span></label>
          <div class="cello-password-wrap">
            <input tabindex="2" id="password" class="cello-input" name="password" type="password" autocomplete="current-password" placeholder="รหัสผ่านอย่างน้อย 8 ตัวอักษร" />
            <button
              class="cello-password-toggle"
              id="cello-password-toggle"
              type="button"
              aria-label="แสดงรหัสผ่าน"
              aria-controls="password"
              aria-pressed="false"
            >
              <span class="cello-password-icon cello-password-icon-eye" aria-hidden="true">
                <svg viewBox="0 0 24 24" focusable="false">
                  <path d="M12 5C6.5 5 2.1 8.4 1 12c1.1 3.6 5.5 7 11 7s9.9-3.4 11-7c-1.1-3.6-5.5-7-11-7Zm0 11.2A4.2 4.2 0 1 1 12 7.8a4.2 4.2 0 0 1 0 8.4Zm0-2.1a2.1 2.1 0 1 0 0-4.2 2.1 2.1 0 0 0 0 4.2Z"/>
                </svg>
              </span>
              <span class="cello-password-icon cello-password-icon-eye-off" aria-hidden="true">
                <svg viewBox="0 0 24 24" focusable="false">
                  <path d="m3.3 2 18.7 18.7-1.4 1.4-3.1-3.1A12.5 12.5 0 0 1 12 20c-5.5 0-9.9-3.4-11-7a11.8 11.8 0 0 1 4.1-5.7L1.9 3.4 3.3 2Zm7 7 1.6 1.6a2.1 2.1 0 0 1 2.5 2.5l1.6 1.6a4.2 4.2 0 0 0-5.7-5.7Zm1.6-4c5.5 0 9.9 3.4 11 7a11.8 11.8 0 0 1-4.1 5.7l-1.5-1.5a9.7 9.7 0 0 0 3.4-4.2c-1.1-2.7-4.7-5-8.8-5-.9 0-1.7.1-2.5.3L7.8 5.6A13 13 0 0 1 11.9 5Z"/>
                </svg>
              </span>
            </button>
          </div>
        </div>

          <p class="cello-reset-copy">
            หากผู้ใช้ต้องการรีเซ็ตรหัสผ่าน สามารถกดปุ่มรีเซ็ตรหัสผ่าน<br/>
            โดยที่ไม่ต้องกรอกชื่อผู้ใช้
            <a href="http://localhost:3000/login?mode=reset">รีเซ็ตรหัสผ่าน</a>
          </p>

        <input type="hidden" id="id-hidden-input" name="credentialId" <#if auth?has_content && auth.selectedCredential?has_content>value="${auth.selectedCredential}"</#if> />

        <button tabindex="4" class="cello-login-button" name="login" id="kc-login" type="submit">
          <svg class="cello-login-icon" viewBox="0 0 24 24" focusable="false" aria-hidden="true">
            <path d="M11 7L9.6 8.4l2.6 2.6H2v2h10.2l-2.6 2.6L11 17l5-5-5-5zm9 12h-8v2h8c1.1 0 2-.9 2-2V5c0-1.1-.9-2-2-2h-8v2h8v14z"/>
          </svg>
          เข้าสู่ระบบ
        </button>
      </form>

      <div class="cello-footer">
        <span>ข้อตกลงการใช้บริการ</span>
        <a
          href="#"
          id="cello-terms-trigger"
          data-terms-api="${(properties.termsApiUrl)!'http://localhost:3000/public/terms-of-use'}"
          data-terms-lang="${(locale.currentLanguageTag)!'th'}"
        >เงื่อนไขการให้บริการ</a>
      </div>
      <div class="cello-version">Version 1.0.1</div>
    </div>

    <div id="cello-terms-modal" class="cello-modal" hidden aria-hidden="true">
      <div class="cello-modal__backdrop" data-close-modal="true"></div>
      <div class="cello-modal__dialog" role="dialog" aria-modal="true" aria-labelledby="cello-terms-title">
        <div class="cello-modal__header">
          <h2 id="cello-terms-title">เงื่อนไขการให้บริการ</h2>
          <button id="cello-terms-close" class="cello-modal__close" type="button" aria-label="ปิด">×</button>
        </div>
        <div id="cello-terms-content" class="cello-modal__content">
          <p class="cello-modal__state">กำลังโหลดข้อมูล...</p>
        </div>
      </div>
    </div>

    <script>
      (function () {
        var trigger = document.getElementById("cello-terms-trigger");
        var loginCard = document.getElementById("cello-login-card");
        var modal = document.getElementById("cello-terms-modal");
        var content = document.getElementById("cello-terms-content");
        var closeButton = document.getElementById("cello-terms-close");

        if (!trigger || !modal || !content || !closeButton) {
          return;
        }

        function escapeHtml(value) {
          return String(value).replace(/[&<>"']/g, function (char) {
            return {
              "&": "&amp;",
              "<": "&lt;",
              ">": "&gt;",
              '"': "&quot;",
              "'": "&#39;"
            }[char];
          });
        }

        function formatPlainText(value) {
          return "<p>" + escapeHtml(value).replace(/\n/g, "<br>") + "</p>";
        }

        function pickTermsContent(payload) {
          if (!payload) {
            return "";
          }

          if (typeof payload === "string") {
            return payload;
          }

          var candidates = [
            payload.html,
            payload.content,
            payload.description,
            payload.detail,
            payload.message,
            payload.termsOfUse,
            payload.terms_of_use,
            payload.data && payload.data.html,
            payload.data && payload.data.content,
            payload.data && payload.data.description,
            payload.data && payload.data.detail,
            payload.result && payload.result.html,
            payload.result && payload.result.content,
            payload.result && payload.result.description
          ];

          for (var index = 0; index < candidates.length; index += 1) {
            if (typeof candidates[index] === "string" && candidates[index].trim()) {
              return candidates[index];
            }
          }

          return "";
        }

        function setLoadingState() {
          content.innerHTML = '<p class="cello-modal__state">กำลังโหลดข้อมูล...</p>';
        }

        function setErrorState() {
          content.innerHTML = '<p class="cello-modal__state cello-modal__state--error">ไม่สามารถโหลดเงื่อนไขการให้บริการได้</p>';
        }

        function normalizeBrandPayload(payload) {
          if (!payload || typeof payload !== "object") {
            return null;
          }

          if (payload.data && typeof payload.data === "object") {
            return payload.data;
          }

          return payload;
        }

        function asSafeHttpUrl(value) {
          if (typeof value !== "string" || !value.trim()) {
            return "";
          }

          try {
            var parsed = new URL(value, window.location.origin);
            if (parsed.protocol === "http:" || parsed.protocol === "https:") {
              return parsed.toString();
            }
          } catch (error) {
            return "";
          }

          return "";
        }

        function toCssUrl(value) {
          return 'url("' + String(value).replace(/["\\]/g, "\\$&") + '")';
        }

        function toFontFamilyCssValue(family, category) {
          if (typeof family !== "string") {
            return "";
          }

          var trimmedFamily = family.trim();
          if (!trimmedFamily || !/^[A-Za-z0-9 _-]{1,80}$/.test(trimmedFamily)) {
            return "";
          }

          var normalizedCategory = String(category || "").toLowerCase();
          var fallback = {
            serif: "serif",
            "sans-serif": "sans-serif",
            monospace: "monospace",
            cursive: "cursive",
            fantasy: "fantasy",
            "system-ui": "system-ui"
          }[normalizedCategory] || "sans-serif";

          return '"' + trimmedFamily.replace(/"/g, '\\"') + '", "Noto Sans Thai", "Sarabun", Arial, ' + fallback;
        }

        function loadWebFont(family) {
          if (typeof family !== "string" || !family.trim()) {
            return;
          }

          var existingLink = document.getElementById("cello-dynamic-font");
          var familyParam = family.trim().replace(/\s+/g, "+");
          var href = "https://fonts.googleapis.com/css2?family=" + familyParam + "&display=swap";

          if (existingLink) {
            existingLink.setAttribute("href", href);
            return;
          }

          var link = document.createElement("link");
          link.id = "cello-dynamic-font";
          link.rel = "stylesheet";
          link.href = href;
          document.head.appendChild(link);
        }

        function isHexColor(value) {
          return typeof value === "string" && /^#[0-9A-Fa-f]{6}$/.test(value.trim());
        }

        function getLightPrimaryColor(themeColors) {
          if (!Array.isArray(themeColors)) {
            return "";
          }

          for (var i = 0; i < themeColors.length; i += 1) {
            var item = themeColors[i];
            if (
              item &&
              String(item.mode || "").toUpperCase() === "LIGHT" &&
              String(item.color_key || "").toLowerCase() === "primary" &&
              isHexColor(item.hex_value)
            ) {
              return item.hex_value.trim();
            }
          }

          return "";
        }

        function applyBrandSettings(payload) {
          var data = normalizeBrandPayload(payload);
          if (!data) {
            return;
          }

          var rootStyle = document.documentElement && document.documentElement.style;
          if (!rootStyle) {
            return;
          }

          var logoUrl = asSafeHttpUrl(data.logo && data.logo.logo_url);
          if (logoUrl) {
            rootStyle.setProperty("--cello-brand-logo-url", toCssUrl(logoUrl));
          }

          var fontCssValue = toFontFamilyCssValue(data.font && data.font.family, data.font && data.font.category);
          if (fontCssValue) {
            rootStyle.setProperty("--cello-font-family", fontCssValue);
            loadWebFont(data.font.family);
          }

          var primaryColor = getLightPrimaryColor(data.theme_colors);
          if (primaryColor) {
            rootStyle.setProperty("--cello-primary", primaryColor);
            rootStyle.setProperty("--cello-link", primaryColor);
          }
        }

        async function loadBrandSettings() {
          if (!loginCard) {
            return;
          }

          var apiUrl = loginCard.getAttribute("data-brand-theme-api");
          if (!apiUrl) {
            return;
          }

          try {
            var response = await fetch(new URL(apiUrl, window.location.origin).toString(), {
              method: "GET",
              headers: {
                "Accept": "application/json"
              }
            });

            if (!response.ok) {
              throw new Error("Request failed with status " + response.status);
            }

            var payload = await response.json();
            applyBrandSettings(payload);
          } catch (error) {
            return;
          }
        }

        function openModal() {
          modal.hidden = false;
          modal.setAttribute("aria-hidden", "false");
          document.body.classList.add("cello-modal-open");
        }

        function closeModal() {
          modal.hidden = true;
          modal.setAttribute("aria-hidden", "true");
          document.body.classList.remove("cello-modal-open");
        }

        async function loadTerms() {
          var apiUrl = trigger.getAttribute("data-terms-api");
          var lang = trigger.getAttribute("data-terms-lang") || "th";

          if (!apiUrl) {
            setErrorState();
            return;
          }

          setLoadingState();
          openModal();

          try {
            var url = new URL(apiUrl, window.location.origin);
            if (!url.searchParams.has("lang")) {
              url.searchParams.set("lang", lang);
            }

            var response = await fetch(url.toString(), {
              method: "GET",
              headers: {
                "Accept": "application/json"
              }
            });

            if (!response.ok) {
              throw new Error("Request failed with status " + response.status);
            }

            var payload = await response.json();
            var termsContent = pickTermsContent(payload);

            if (!termsContent) {
              throw new Error("Terms content is empty");
            }

            var looksLikeHtml = /<[a-z][\s\S]*>/i.test(termsContent);
            content.innerHTML = looksLikeHtml ? termsContent : formatPlainText(termsContent);
          } catch (error) {
            setErrorState();
          }
        }

        trigger.addEventListener("click", function (event) {
          event.preventDefault();
          loadTerms();
        });

        closeButton.addEventListener("click", closeModal);

        modal.addEventListener("click", function (event) {
          if (event.target && event.target.getAttribute("data-close-modal") === "true") {
            closeModal();
          }
        });

        document.addEventListener("keydown", function (event) {
          if (event.key === "Escape" && !modal.hidden) {
            closeModal();
          }
        });

        var usernameInput = document.getElementById("username");
        var passwordInput = document.getElementById("password");
        var loginButton = document.getElementById("kc-login");
        var passwordToggle = document.getElementById("cello-password-toggle");

        function updateLoginButtonState() {
          if (!usernameInput || !passwordInput || !loginButton) {
            return;
          }

          var hasUsername = usernameInput.value.trim().length > 0;
          var hasPassword = passwordInput.value.length > 0;
          loginButton.classList.toggle("is-ready", hasUsername && hasPassword);
        }

        function updatePasswordToggleState() {
          if (!passwordInput || !passwordToggle) {
            return;
          }

          var isVisible = passwordInput.type === "text";
          passwordToggle.setAttribute("aria-pressed", isVisible ? "true" : "false");
          passwordToggle.setAttribute("aria-label", isVisible ? "ซ่อนรหัสผ่าน" : "แสดงรหัสผ่าน");
          passwordToggle.classList.toggle("is-visible", isVisible);
        }

        if (passwordToggle && passwordInput) {
          passwordToggle.addEventListener("click", function () {
            passwordInput.type = passwordInput.type === "password" ? "text" : "password";
            updatePasswordToggleState();
          });
          updatePasswordToggleState();
        }

        var usernameClear = document.getElementById("cello-username-clear");

        function updateUsernameClearState() {
          if (!usernameInput || !usernameClear) return;
          usernameClear.style.display = usernameInput.value.length > 0 ? "inline-flex" : "none";
        }

        if (usernameClear && usernameInput) {
          usernameClear.addEventListener("click", function() {
            usernameInput.value = "";
            usernameInput.focus();
            updateUsernameClearState();
            updateLoginButtonState();
          });
          usernameInput.addEventListener("input", updateUsernameClearState);
          updateUsernameClearState();
        }

        if (usernameInput && passwordInput) {
          usernameInput.addEventListener("input", updateLoginButtonState);
          passwordInput.addEventListener("input", updateLoginButtonState);
          updateLoginButtonState();
        }

        loadBrandSettings();
      }());
    </script>
  </#if>
</@layout.registrationLayout>
