const tailwindcss = require("tailwindcss");

module.exports = {
  content: ["./Output/**/*.html"],
  theme: {
      fontFamily: {
        'sans': ['Vollkorn'],
        'serif': ['Vollkorn'],
      },
      extend: {
        colors: {
          'rwb-background-dark': '#101315',
          'rwb-text-dark': '#e8e6e3',
          'rwb-link-light': '#3366cc',
          'rwb-link-dark': '#689fd9',
          'rwb-button-background-dark': '#254a93',
          'rwb-slate-light': '#ebedef',
          'rwb-slate-code-light': '#f6f8fa',
          'rwb-slate-code-dark': '#161b22'
        },
      }
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
}
