// Marriage Profiles JavaScript
import "cocoon"

document.addEventListener('DOMContentLoaded', function() {
  console.log("Marriage Profiles JS loaded");
  console.log("Checking if Cocoon is loaded:", typeof window.cocoon !== 'undefined');

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

  // Initialize Cocoon
  if (typeof window.cocoon !== 'undefined') {
    console.log("Initializing Cocoon links");
    $('.add_fields').on('click', function() {
      console.log("Add fields clicked");
    });
    $('.remove_fields').on('click', function() {
      console.log("Remove fields clicked");
    });
  }
}); 