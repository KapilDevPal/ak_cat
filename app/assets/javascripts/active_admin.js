// Active Admin JS
//= require active_admin/base

// Basic ActiveAdmin JS functionality

document.addEventListener('DOMContentLoaded', function() {
  // Toggle dropdown menus
  const dropdowns = document.querySelectorAll('.has_dropdown');
  if (dropdowns) {
    dropdowns.forEach(dropdown => {
      dropdown.addEventListener('click', function(e) {
        e.preventDefault();
        this.classList.toggle('open');
      });
    });
  }

  // Flash message auto-hide
  const flashes = document.querySelectorAll('.flash');
  if (flashes) {
    flashes.forEach(flash => {
      setTimeout(() => {
        flash.style.opacity = '0';
        setTimeout(() => {
          flash.style.display = 'none';
        }, 600);
      }, 5000);
    });
  }

  // Tabs
  const tabLinks = document.querySelectorAll('.tabs li a');
  if (tabLinks) {
    tabLinks.forEach(link => {
      link.addEventListener('click', function(e) {
        e.preventDefault();
        
        // Remove active class from all tabs
        document.querySelectorAll('.tabs li').forEach(tab => {
          tab.classList.remove('active');
        });
        
        // Hide all tab content
        document.querySelectorAll('.tab-content').forEach(content => {
          content.style.display = 'none';
        });
        
        // Add active class to current tab
        this.parentNode.classList.add('active');
        
        // Show current tab content
        const targetId = this.getAttribute('href').substring(1);
        document.getElementById(targetId).style.display = 'block';
      });
    });
  }
});
