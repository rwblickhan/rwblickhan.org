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
          'rwb-blue': '#2f68b3',
          'rwb-slate-med': '#ebedef',
          'rwb-slate-light': '#f9f9f9',
          'rwb-slate-dark': '#ccc'
        },
      }
  },
  plugins: [
    require('@tailwindcss/typography')
  ],
}
