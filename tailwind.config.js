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
          'rwb-blue-light': '#3366cc',
          'rwb-blue-dark': '#2e5cb8',
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
