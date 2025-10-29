// Debug script for mobile UI issues
console.log('🔍 Mobile UI Debug Script Loaded');

function debugMobileUI() {
    console.log('🔍 === MOBILE UI DEBUG ===');
    console.log('Window size:', window.innerWidth + 'x' + window.innerHeight);
    console.log('Orientation:', window.orientation || 'unknown');
    console.log('Body classes:', document.body.className);

    // Check if mobile mode is detected
    const isMobile = document.body.classList.contains('mobile-mode') || window.innerWidth <= 820;
    console.log('Is mobile mode:', isMobile);

    // Check if sidebar exists and is visible
    const sidebar = document.getElementById('sidebar');
    if (sidebar) {
        const style = window.getComputedStyle(sidebar);
        console.log('Sidebar display:', style.display);
        console.log('Sidebar visibility:', style.visibility);
        console.log('Sidebar width:', style.width);
    }

    // Check mobile right panel
    const mobilePanel = document.getElementById('mobile-right-panel');
    if (mobilePanel) {
        const style = window.getComputedStyle(mobilePanel);
        console.log('Mobile panel display:', style.display);
        console.log('Mobile panel visibility:', style.visibility);
    }

    // Check welcome screen
    const welcome = document.getElementById('welcome-screen');
    if (welcome) {
        const style = window.getComputedStyle(welcome);
        console.log('Welcome screen display:', style.display);
    }

    // Check if part tabs exist
    const partTabs = document.getElementById('part-tabs');
    if (partTabs) {
        console.log('Part tabs exists, innerHTML length:', partTabs.innerHTML.length);
    }

    // Check materials panels
    const fabricPanels = document.getElementById('fabric-panels');
    const legsPanels = document.getElementById('legs-panels');
    console.log('Fabric panels exists:', !!fabricPanels);
    console.log('Legs panels exists:', !!legsPanels);
}

// Run debug on load and resize
window.addEventListener('load', () => setTimeout(debugMobileUI, 1000));
window.addEventListener('resize', () => setTimeout(debugMobileUI, 500));

// Add debug button to page
document.addEventListener('DOMContentLoaded', () => {
    const debugBtn = document.createElement('button');
    debugBtn.textContent = '🔍 Debug Mobile UI';
    debugBtn.style.cssText = `
        position: fixed;
        bottom: 10px;
        left: 10px;
        z-index: 10000;
        padding: 8px 12px;
        background: #f39c12;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 12px;
    `;
    debugBtn.onclick = debugMobileUI;
    document.body.appendChild(debugBtn);
});

console.log('🔍 Debug script setup complete');
