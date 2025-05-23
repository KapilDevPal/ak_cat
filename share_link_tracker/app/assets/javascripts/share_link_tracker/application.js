// Share Link Tracker JavaScript
console.log('Share Link Tracker application loaded');

document.addEventListener('DOMContentLoaded', function() {
  // Copy button functionality
  document.querySelectorAll('.copy-button').forEach(function(button) {
    button.addEventListener('click', function() {
      const textToCopy = this.getAttribute('data-clipboard-text');
      navigator.clipboard.writeText(textToCopy).then(function() {
        const originalText = button.innerHTML;
        button.innerHTML = '<i class="fas fa-check"></i> Copied!';
        setTimeout(function() {
          button.innerHTML = originalText;
        }, 2000);
      }).catch(function(err) {
        console.error('Failed to copy text: ', err);
      });
    });
  });
}); 