/** @type {import('tailwindcss').Config} */
export default {
    content: [
      "./resources/**/*.blade.php",
      "./resources/**/*.js",
      "./resources/**/*.vue",
    ],
    theme: {
      extend: {},
    },
    plugins: [
      function ({ addUtilities }) {
        addUtilities({
          //add some custom syntax
          '.bg-scale-dark': { backgroundColor: 'var(--scale-dark)' },
          '.mx1\\/4': { margin: '0 25%' },
        });
      },
    ],
}