if ('IntersectionObserver' in window && !matchMedia('(prefers-reduced-motion: reduce)').matches) {
  const reveal = new IntersectionObserver((entries, observer) => entries.forEach(entry => {
    if (entry.isIntersecting) { entry.target.classList.add('motion-enter'); observer.unobserve(entry.target); }
  }), { threshold: 0.12 });
  document.querySelectorAll('.program>.program-heading, .program-layout, .video-gallery, .faq, footer').forEach(el => reveal.observe(el));
}
