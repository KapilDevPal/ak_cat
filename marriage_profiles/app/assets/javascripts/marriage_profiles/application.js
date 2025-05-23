// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
//= require_tree .

// Marriage Profiles JavaScript

document.addEventListener('DOMContentLoaded', function() {
  // Form validation
  const forms = document.querySelectorAll('.needs-validation');
  
  Array.from(forms).forEach(form => {
    form.addEventListener('submit', event => {
      if (!form.checkValidity()) {
        event.preventDefault();
        event.stopPropagation();
      }
      form.classList.add('was-validated');
    }, false);
  });

  // Photo preview
  const photoInput = document.querySelector('input[type="file"]');
  if (photoInput) {
    photoInput.addEventListener('change', function(e) {
      const file = e.target.files[0];
      if (file) {
        const reader = new FileReader();
        reader.onload = function(e) {
          const preview = document.querySelector('.img-thumbnail');
          if (preview) {
            preview.src = e.target.result;
          }
        };
        reader.readAsDataURL(file);
      }
    });
  }

  // Search form submission
  const searchForm = document.querySelector('form[action*="search"]');
  if (searchForm) {
    searchForm.addEventListener('submit', function(e) {
      const searchInput = this.querySelector('input[type="text"]');
      if (!searchInput.value.trim()) {
        e.preventDefault();
      }
    });
  }
}); 