<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta
    name="description"
    content="NexusShop modern responsive e-commerce storefront"
  >

  <title>NexusShop | Modern E-Commerce</title>

  <!-- Google Fonts -->
  https://fonts.googleapis.com
  https://fonts.gstatic.com
  https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&family=Manrope:wght@700;800&display=swap

  <!-- Font Awesome -->
  https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css

  <style>
    :root {
      --primary: #081c2d;
      --primary-light: #12364d;
      --accent: #27d9e8;
      --accent-dark: #08a9ba;
      --background: #f6f8fb;
      --surface: #ffffff;
      --surface-soft: #edf2f6;
      --text: #091a2a;
      --muted: #667085;
      --border: #e4eaf0;
      --danger: #ef476f;
      --success: #16a34a;
      --warning: #ffb703;
      --radius-small: 14px;
      --radius-medium: 22px;
      --radius-large: 34px;
      --container: 1240px;
      --shadow:
        0 18px 50px rgba(8, 28, 45, 0.09);
    }

    * {
      box-sizing: border-box;
    }

    html {
      scroll-behavior: smooth;
    }

    body {
      margin: 0;
      font-family: "Inter", system-ui, sans-serif;
      color: var(--text);
      background: var(--background);
      line-height: 1.55;
    }

    body.no-scroll {
      overflow: hidden;
    }

    button,
    input {
      font: inherit;
    }

    button,
    a {
      -webkit-tap-highlight-color: transparent;
    }

    button {
      cursor: pointer;
    }

    a {
      color: inherit;
      text-decoration: none;
    }

    img {
      display: block;
      max-width: 100%;
    }

    .container {
      width: min(calc(100% - 32px), var(--container));
      margin-inline: auto;
    }

    .section {
      padding: 82px 0;
    }

    .eyebrow {
      color: var(--accent-dark);
      font-size: 12px;
      font-weight: 800;
      letter-spacing: 0.18em;
      text-transform: uppercase;
    }

    .section-header {
      display: flex;
      align-items: flex-end;
      justify-content: space-between;
      gap: 24px;
      margin-bottom: 32px;
    }

    .section-header h2 {
      margin: 8px 0 0;
      font-family: "Manrope", sans-serif;
      font-size: clamp(32px, 4vw, 48px);
      line-height: 1.05;
      letter-spacing: -0.04em;
    }

    .section-header p {
      max-width: 430px;
      margin: 0;
      color: var(--muted);
    }

    .sr-only {
      position: absolute;
      width: 1px;
      height: 1px;
      padding: 0;
      margin: -1px;
      overflow: hidden;
      clip: rect(0, 0, 0, 0);
      white-space: nowrap;
      border: 0;
    }

    /* Header */

    .site-header {
      position: sticky;
      top: 0;
      z-index: 50;
      border-bottom: 1px solid rgba(8, 28, 45, 0.07);
      background: rgba(255, 255, 255, 0.88);
      backdrop-filter: blur(18px);
    }

    .header-content {
      min-height: 78px;
      display: flex;
      align-items: center;
      gap: 28px;
    }

    .logo {
      font-family: "Manrope", sans-serif;
      font-size: 22px;
      font-weight: 800;
      letter-spacing: -0.05em;
      white-space: nowrap;
    }

    .logo span {
      color: var(--accent-dark);
    }

    .desktop-navigation {
      display: flex;
      gap: 26px;
      font-size: 14px;
      font-weight: 700;
    }

    .desktop-navigation a {
      transition: color 0.2s ease;
    }

    .desktop-navigation a:hover {
      color: var(--accent-dark);
    }

    .search-container {
      margin-left: auto;
      width: min(330px, 32vw);
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 0 15px;
      border: 1px solid var(--border);
      border-radius: 16px;
      background: var(--background);
      transition: 0.2s ease;
    }

    .search-container:focus-within {
      border-color: var(--accent-dark);
      box-shadow: 0 0 0 4px rgba(39, 217, 232, 0.13);
    }

    .search-container input {
      width: 100%;
      padding: 12px 0;
      border: 0;
      outline: 0;
      background: transparent;
    }

    .header-actions {
      display: flex;
      gap: 8px;
    }

    .icon-button {
      position: relative;
      width: 43px;
      height: 43px;
      display: grid;
      place-items: center;
      border: 0;
      border-radius: 14px;
      background: transparent;
      color: var(--text);
      transition: 0.2s ease;
    }

    .icon-button:hover {
      background: var(--background);
    }

    .icon-button.cart-button {
      background: var(--primary);
      color: white;
    }

    .icon-button.cart-button:hover {
      background: var(--accent-dark);
    }

    .menu-button {
      display: none;
    }

    .counter {
      position: absolute;
      right: -5px;
      top: -6px;
      min-width: 19px;
      height: 19px;
      padding: 0 5px;
      display: none;
      place-items: center;
      border-radius: 999px;
      background: var(--accent);
      color: var(--primary);
      font-size: 10px;
      font-weight: 800;
    }

    .counter.visible {
      display: grid;
    }

    /* Hero */

    .hero {
      padding-top: 28px;
    }

    .hero-card {
      position: relative;
      min-height: 610px;
      display: flex;
      align-items: center;
      overflow: hidden;
      border-radius: var(--radius-large);
      background: var(--primary);
      color: white;
      box-shadow: var(--shadow);
    }

    .hero-image,
    .hero-overlay {
      position: absolute;
      inset: 0;
    }

    .hero-image {
      width: 100%;
      height: 100%;
      object-fit: cover;
      opacity: 0.56;
    }

    .hero-overlay {
      background:
        linear-gradient(
          90deg,
          rgba(5, 19, 31, 0.98) 0%,
          rgba(5, 19, 31, 0.79) 48%,
          rgba(5, 19, 31,
