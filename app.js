/**
 * Cybersecurity Company Mukhammed
 * Dynamic Card Loader from data.json
 */

document.addEventListener('DOMContentLoaded', () => {
  loadDataCards();
});

// Fallback data in case the page is opened directly via file:/// protocol
// where browser security blocks local XMLHttpRequest/fetch
const fallbackData = [
  {
    title: "Двухфакторная аутентификация",
    priority: "Высокий",
    active: true,
    tags: ["пароли", "безопасность", "аккаунт"]
  },
  {
    title: "Проверка ссылок на фишинг",
    priority: "Критический",
    active: true,
    tags: ["мошенники", "почта", "ссылки"]
  },
  {
    title: "Использование публичного Wi-Fi",
    priority: "Средний",
    active: false,
    tags: ["сети", "шифрование", "vpn"]
  }
];

/**
 * Loads data from data.json and renders cards into #cards-container
 */
async function loadDataCards() {
  const container = document.getElementById('cards-container');
  const countBadge = document.getElementById('cards-count');

  if (!container) return;

  try {
    const response = await fetch('./data.json', { cache: 'no-cache' });
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    const data = await response.json();
    renderCards(data, container, countBadge);
  } catch (error) {
    console.warn('Не удалось загрузить data.json через fetch (возможно, локальный файл file:///). Используем резервные данные:', error);
    renderCards(fallbackData, container, countBadge);
  }
}

/**
 * Renders array of card objects into DOM
 * @param {Array} cards 
 * @param {HTMLElement} container 
 * @param {HTMLElement} countBadge 
 */
function renderCards(cards, container, countBadge) {
  if (!Array.isArray(cards) || cards.length === 0) {
    container.innerHTML = `
      <div class="empty-state">
        <p>Нет доступных данных для отображения.</p>
      </div>
    `;
    if (countBadge) countBadge.textContent = '0 элементов';
    return;
  }

  if (countBadge) {
    const count = cards.length;
    countBadge.textContent = `${count} ${pluralize(count, ['элемент', 'элемента', 'элементов'])}`;
  }

  container.innerHTML = cards.map(item => createCardMarkup(item)).join('');
}

/**
 * Generates HTML string for a single card
 * @param {Object} item 
 * @returns {string}
 */
function createCardMarkup(item) {
  const priorityInfo = getPriorityInfo(item.priority);
  const statusClass = item.active ? 'status-active' : 'status-inactive';
  const statusLabel = item.active ? 'Активно' : 'Неактивно';
  const cardActiveModifier = item.active ? 'card-active' : 'card-inactive';

  const tagsMarkup = Array.isArray(item.tags)
    ? item.tags.map(tag => `<span class="tag">#${escapeHtml(tag)}</span>`).join('')
    : '';

  return `
    <article class="data-card ${cardActiveModifier}">
      <div class="data-card-header">
        <div class="priority-badge ${priorityInfo.cssClass}">
          <span class="badge-icon" aria-hidden="true">${priorityInfo.icon}</span>
          <span>${escapeHtml(item.priority || 'Обычный')}</span>
        </div>
        <div class="status-badge ${statusClass}">
          <span class="status-indicator"></span>
          <span>${statusLabel}</span>
        </div>
      </div>

      <h3 class="data-card-title">${escapeHtml(item.title || 'Без названия')}</h3>

      ${tagsMarkup ? `<div class="data-card-tags">${tagsMarkup}</div>` : ''}
    </article>
  `;
}

/**
 * Helper to determine badge style and icon by priority level
 * @param {string} priority 
 */
function getPriorityInfo(priority) {
  const p = (priority || '').trim().toLowerCase();
  if (p === 'критический') {
    return { cssClass: 'priority-critical', icon: '⚡' };
  } else if (p === 'высокий') {
    return { cssClass: 'priority-high', icon: '🛡️' };
  } else if (p === 'средний') {
    return { cssClass: 'priority-medium', icon: '🔹' };
  }
  return { cssClass: 'priority-normal', icon: '📌' };
}

/**
 * Escape HTML special characters for XSS prevention
 * @param {string} str 
 */
function escapeHtml(str) {
  if (typeof str !== 'string') return '';
  return str
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#039;');
}

/**
 * Russian word pluralization helper
 */
function pluralize(n, forms) {
  const mod10 = n % 10;
  const mod100 = n % 100;
  if (mod100 >= 11 && mod100 <= 19) return forms[2];
  if (mod10 === 1) return forms[0];
  if (mod10 >= 2 && mod10 <= 4) return forms[1];
  return forms[2];
}
